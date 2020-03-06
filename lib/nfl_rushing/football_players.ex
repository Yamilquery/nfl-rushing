defmodule NflRushing.FootballPlayers do
  @moduledoc """
  theScore "the Rush" Interview Challenge
  """

  @type player_params :: %{
    player_name: String.t,
    field: String.t,
    direction: String.t
  }

  @doc """
  List football players by Player's name or sort them by Total Rushing Yards,
  Longest Rush, and Total Rushing Touchdowns.
  """
  @spec list_rushing(params :: player_params) :: map()
  def list_rushing(params) do
    load_rushing()
    |> sort_by_player_name(params)
    |> order_by(params)
  end

  def generate_csv(params) do
    players = list_rushing(params)
    csv_headers = "Player\tTeam\tPos\tAtt/G\tAtt\tYds\tAvg\tYds/G\tTD\tLng\t1st\t1st%\t20+\t40+\tFUM"
    csv_content = Enum.map(players, fn p ->
      "#{p["Player"]}\t#{p["Team"]}\t#{p["Pos"]}\t#{p["Att/G"]}\t#{p["Att"]}\t#{p["Yds"]}\t#{p["Avg"]}\t#{p["Yds/G"]}\t#{p["TD"]}\t#{p["Lng"]}\t#{p["1st"]}\t#{p["1st%"]}\t#{p["20+"]}\t#{p["40+"]}\t#{p["FUM"]}"
    end)
    |> Enum.join("\n")

    "#{csv_headers}\n#{csv_content}"
  end

  ## private helpers

  defp load_rushing() do
    {:ok, results} = "rushing.json"
      |> Path.relative_to_cwd()
      |> File.read!()
      |> Jason.decode()
    results
  end

  defp sort_by_player_name(results, %{"player_name" => player_name}) do
    case String.trim(player_name) do
      "" -> results

      _ -> Enum.filter(results, fn player ->
        String.contains?(
          String.downcase(player["Player"]),
          String.downcase(player_name)
        )
      end)
    end
  end
  defp sort_by_player_name(results, _), do: results

  defp parse_direction(direction) do
    direction = direction
      |> String.trim()
      |> String.downcase()
    if Enum.member?(["asc", "desc"], direction) do
      {:ok, String.to_atom(direction)}
    else
      %{
        "error" =>
        "Only the values 'desc' or 'asc' are allowed for the 'direction' parameter."
      }
    end
  end

  defp parse_field(field) do
    field = String.trim(field)
    if Enum.member?(["Lng", "TD", "Yds"], field) do
      {:ok, field}
    else
      %{
        "error" =>
        "Only the values 'Lng', 'TD' or 'Yds' are allowed for the 'field' parameter."
      }
    end
  end

  defp parse_to_integer(arg) when is_integer(arg), do: arg
  defp parse_to_integer(arg), do: arg
    |> String.replace("T", "")
    |> String.replace(",", "")
    |> String.to_integer()

  defp order_by(results, %{"field" => field, "direction" => direction}) do
    with {:ok, direction} <- parse_direction(direction),
      {:ok, field} <- parse_field(field)
    do
      Enum.sort(results, fn (a, b) ->
        if (direction == :desc) do
          parse_to_integer(a[field]) >= parse_to_integer(b[field])
        else
          parse_to_integer(a[field]) < parse_to_integer(b[field])
        end
      end)
    else
      reply -> reply
    end
  end
  defp order_by(results, _), do: results
end
