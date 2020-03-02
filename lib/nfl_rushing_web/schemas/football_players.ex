defmodule NflRushingWeb.Schema.FootballPlayers do
  use Absinthe.Schema.Notation
  import_types Absinthe.Type.Custom

  @desc "The field and direction to order locations"
  input_object :football_player_order do
    @desc "The order field"
    field(:field, non_null(:football_player_order_field))

    @desc "The order direction"
    field(:direction, non_null(:order_direction))
  end

  object :football_player do
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
  end
end
