defmodule NflRushingWeb.PageController do
  use NflRushingWeb, :controller
  alias NflRushing.FootballPlayers
  alias NflRushing.FootballPlayers.Model.FootballPlayer

  def index(conn, _params) do
    html(conn, File.read!("./priv/static/index.html"))
  end

  def download_csv(conn, params) do
    players = FootballPlayers.all(nil, string_map_to_atoms(params))
    csv_headers = "Player,Team,Pos,Att/G,Att,Yds,Avg,Yds/G,TD,Lng,1st,1st%,20+,40+,FUM"
    csv_content = Enum.map(players, fn %FootballPlayer{
      player_name: player,
      team_abbreviation: team,
      player_position: pos,
      rushing_attemps_per_game_avg: att_g,
      rushing_attemps: att,
      total_rushing_yards: yds,
      rushing_average_yards_per_attempt: avg,
      rushing_yards_per_game: yds_g,
      total_rushing_touchdowns: td,
      longest_rush: lng,
      longest_rush_touchdown: lngt,
      rushing_first_downs: st1,
      rushing_first_down_percentage: st1_,
      rushing_20_yards_each: r_20,
      rushing_40_yards_each: r_40,
      rushing_fumbles: fum,
    } ->
      lngt = if (lngt), do: "#{lng}T", else: "#{lng}"
      "#{player},#{team},#{pos},#{att_g},#{att},#{yds},#{avg},#{yds_g},#{td},#{lngt},#{st1},#{st1_},#{r_20},#{r_40},#{fum}"
    end)
    |> Enum.join("\n")

    conn
    |> put_resp_content_type("text/csv")
    |> put_resp_header(
      "content-disposition",
      "attachment; filename=\"NFL Players' Rushing Statistics.csv\""
    )
    |> send_resp(200, "#{csv_headers}\n#{csv_content}")
  end

  defp string_map_to_atoms(string_key_map) do
    for {key, val} <- string_key_map, into: %{}, do: {String.to_atom(key), val}
  end
end
