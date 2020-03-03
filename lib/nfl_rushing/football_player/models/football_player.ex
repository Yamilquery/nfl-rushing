defmodule NflRushing.FootballPlayers.Model.FootballPlayer do
  use Ecto.Schema
  import Ecto.Changeset

  # coveralls-ignore-start
  schema "football_players" do
    field :player_name, :string
    field :team_abbreviation, :string
    field :player_position, :string
    field :rushing_attemps_per_game_avg, :float
    field :rushing_attemps, :float
    field :total_rushing_yards, :float
    field :rushing_average_yards_per_attempt, :float
    field :rushing_yards_per_game, :float
    field :total_rushing_touchdowns, :float
    field :longest_rush, :float
    field :longest_rush_touchdown, :boolean
    field :rushing_first_downs, :float
    field :rushing_first_down_percentage, :float
    field :rushing_20_yards_each, :float
    field :rushing_40_yards_each, :float
    field :rushing_fumbles, :float

    timestamps()
  end

  @doc false
  def changeset(%__MODULE__{} = post, attrs) do
    post
    |> cast(attrs, [:player_name, :team_abbreviation, :player_position,
      :rushing_attemps_per_game_avg, :rushing_attemps, :total_rushing_yards,
      :rushing_average_yards_per_attempt, :rushing_yards_per_game,
      :total_rushing_touchdowns, :longest_rush, :longest_rush_touchdown,
      :rushing_first_downs, :rushing_first_down_percentage,
      :rushing_20_yards_each, :rushing_40_yards_each, :rushing_fumbles
    ])
    |> validate_required([:player_name, :rushing_attemps_per_game_avg])
  end
  # coveralls-ignore-stop

end
