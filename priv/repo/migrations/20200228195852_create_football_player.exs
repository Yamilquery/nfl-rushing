defmodule NflRushing.Repo.Migrations.CreateFootballPlayer do
  use Ecto.Migration

  def change do
    create table(:football_players) do
      add :player_name, :string
      add :team_abbreviation, :string
      add :player_position, :string
      add :rushing_attemps_per_game_avg, :integer
      add :rushing_attemps, :integer
      add :total_rushing_yards, :integer
      add :rushing_average_yards_per_attempt, :integer
      add :rushing_yards_per_game, :integer
      add :total_rushing_touchdowns, :integer
      add :longest_rush, :integer
      add :rushing_first_downs, :integer
      add :rushing_first_down_percentage, :integer
      add :rushing_20_yards_each, :integer
      add :rushing_40_yards_each, :integer
      add :rushing_fumbles, :integer

      timestamps()
    end

  end
end
