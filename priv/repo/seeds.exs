alias NflRushing.FootballPlayers.Model.FootballPlayer

%FootballPlayer{}
|> FootballPlayer.changeset(%{
  player_name: "Joe Banyard",
  team_abbreviation: "JAX",
  player_position: "RB",
  rushing_attemps_per_game_avg: 2,
  rushing_attemps: 2,
  total_rushing_yards: 7,
  rushing_average_yards_per_attempt: 3,
  rushing_yards_per_game: 7,
  total_rushing_touchdowns: 2,
  longest_rush: "7",
  rushing_first_downs: 0,
  rushing_first_down_percentage: 0,
  rushing_20_yards_each: 0,
  rushing_40_yards_each: 0,
  rushing_fumbles: 0,
})
|> NflRushing.Repo.insert!

%FootballPlayer{}
|> FootballPlayer.changeset(%{
  player_name: "Shaun Hill",
  team_abbreviation: "MIN",
  player_position: "QB",
  rushing_attemps_per_game_avg: 2,
  rushing_attemps: 2,
  total_rushing_yards: 4,
  rushing_average_yards_per_attempt: 3,
  rushing_yards_per_game: 7,
  total_rushing_touchdowns: 0,
  longest_rush: "4",
  rushing_first_downs: 0,
  rushing_first_down_percentage: 0,
  rushing_20_yards_each: 0,
  rushing_40_yards_each: 0,
  rushing_fumbles: 0,
})
|> NflRushing.Repo.insert!
