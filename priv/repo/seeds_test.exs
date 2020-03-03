alias NflRushing.FootballPlayers.Model.FootballPlayer

%FootballPlayer{}
|> FootballPlayer.changeset(%{
  player_name: "Yamil Díaz",
  team_abbreviation: "NYG",
  player_position: "RB",
  rushing_attemps_per_game_avg: 181,
  rushing_attemps: 13.9,
  total_rushing_yards: 593,
  rushing_average_yards_per_attempt: 3.3,
  rushing_yards_per_game: 45.6,
  total_rushing_touchdowns: 3,
  longest_rush: 25,
  longest_rush_touchdown: true,
  rushing_first_downs: 16,
  rushing_first_down_percentage: 16,
  rushing_20_yards_each: 3,
  rushing_40_yards_each: 0,
  rushing_fumbles: 0,
})
|> NflRushing.Repo.insert!


Enum.each(1..10000, fn _e ->

  chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" |> String.split("")

  player_name_random = Enum.reduce((1..10), [], fn (_i, acc) ->
    [Enum.random(chars) | acc]
  end) |> Enum.join("")

  team_and_player_random = Enum.reduce((1..3), [], fn (_i, acc) ->
    [Enum.random(chars) | acc]
  end) |> Enum.join("")

  %FootballPlayer{}
  |> FootballPlayer.changeset(%{
    player_name: player_name_random,
    team_abbreviation: team_and_player_random,
    player_position: team_and_player_random,
    rushing_attemps_per_game_avg: 181,
    rushing_attemps: 13.9,
    total_rushing_yards: 593,
    rushing_average_yards_per_attempt: 3.3,
    rushing_yards_per_game: 45.6,
    total_rushing_touchdowns: 3,
    longest_rush: 25,
    longest_rush_touchdown: true,
    rushing_first_downs: 16,
    rushing_first_down_percentage: 16,
    rushing_20_yards_each: 3,
    rushing_40_yards_each: 0,
    rushing_fumbles: 0,
  })
  |> NflRushing.Repo.insert!
end)

