defmodule NflRushing.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get "/" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Jason.encode!(message()))
  end

  defp message do
    %{
      longest_rush: "75T",
      longest_rush_touchdown: true,
      player_name: "DeMarco Murray",
      player_position: "RB",
      rushing_20_yards_each: 4.0,
      rushing_40_yards_each: 2.0,
      rushing_attemps: 293.0,
      rushing_attemps_per_game_avg: 18.3,
      rushing_average_yards_per_attempt: 4.4,
      rushing_first_down_percentage: 21.8,
      rushing_first_downs: 64.0,
      rushing_fumbles: 3.0,
      rushing_yards_per_game: 80.4,
      team_abbreviation: "TEN",
      total_rushing_touchdowns: 9.0,
      total_rushing_yards: 1287.0
    }
  end
end
