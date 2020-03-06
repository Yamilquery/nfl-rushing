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

  get "/download-csv" do
    conn
    |> put_resp_content_type("text/csv")
    |> put_resp_header(
      "content-disposition",
      "attachment; filename=\"NFL Players' Rushing Statistics.csv\""
    )
    |> send_resp(200,
      conn.params
      |> FootballPlayers.generate_csv()
    )
  end

end
