defmodule NflRushing.FootballPlayers.Model.FootballPlayer do
  use Ecto.Schema

  # coveralls-ignore-start
  schema "football_players" do
    field :player_name, :string
    field :team_abreviation, :string
    field :player_position, :string
    field :rushing_attemps_per_game_avg, :float
    field :rushing_attemps, :float
    field :total_rushing_yards, :float
    field :rushing_average_yards_per_attempt, :float
    field :rushing_yards_per_game, :float
    field :total_rushing_touchdowns, :float
    field :longest_rush, :string
    field :rushing_first_downs, :float
    field :rushing_first_down_percentage, :float
    field :rushing_20_yards_each, :float
    field :rushing_40_yards_each, :float
    field :rushing_fumbles, :float

    timestamps()
  end
  # coveralls-ignore-stop

end
