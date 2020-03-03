alias NflRushing.FootballPlayers.Model.FootballPlayer


{:ok, data} = Path.relative_to_cwd("rushing.json")
  |> File.read!()
  |> Jason.decode()

Enum.filter(data, fn d ->
  lng = if String.valid?(d["Lng"]), do: d["Lng"], else: Integer.to_string(d["Lng"])

  yds = if String.valid?(d["Yds"]) do
    d["Yds"]
    |> String.replace(",", "")
    |> String.to_integer()
  else
    d["Yds"]
  end

  td = if String.valid?(d["TD"]) do
    d["TD"]
    |> String.replace(",", "")
    |> String.to_integer()
  else
    d["TD"]
  end


  %FootballPlayer{}
  |> FootballPlayer.changeset(%{
    player_name: d["Player"],
    team_abbreviation: d["Team"],
    player_position: d["Pos"],
    rushing_attemps_per_game_avg: d["Att/G"],
    rushing_attemps: d["Att"],
    total_rushing_yards: yds,
    rushing_average_yards_per_attempt: d["Avg"],
    rushing_yards_per_game: d["Yds/G"],
    total_rushing_touchdowns: td,
    longest_rush: lng,
    rushing_first_downs: d["1st"],
    rushing_first_down_percentage: d["1st%"],
    rushing_20_yards_each: d["20+"],
    rushing_40_yards_each: d["40+"],
    rushing_fumbles: d["FUM"],
  })
  |> NflRushing.Repo.insert!
end)

