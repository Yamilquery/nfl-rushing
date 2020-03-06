defmodule NflRushing.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  alias NflRushing.FootballPlayers

  get "/" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200,
      conn.params
      |> FootballPlayers.list_rushing()
      |> Jason.encode!()
    )
  end

end
