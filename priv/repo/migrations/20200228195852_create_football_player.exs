defmodule NflRushing.Repo.Migrations.CreateFootballPlayer do
  use Ecto.Migration

  def change do
    create table(:football_players) do
      add :player_name, :string
      add :team_abbreviation, :string
      add :player_position, :string
      add :rushing_attemps_per_game_avg, :float
      add :rushing_attemps, :float
      add :total_rushing_yards, :float
      add :rushing_average_yards_per_attempt, :float
      add :rushing_yards_per_game, :float
      add :total_rushing_touchdowns, :float
      add :longest_rush, :string
      add :rushing_first_downs, :float
      add :rushing_first_down_percentage, :float
      add :rushing_20_yards_each, :float
      add :rushing_40_yards_each, :float
      add :rushing_fumbles, :float

      timestamps()
    end

  end
end
