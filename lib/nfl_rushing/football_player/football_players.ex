defmodule NflRushing.FootballPlayers do
  import Ecto.Query

  alias NflRushing.Repo
  alias NflRushing.FootballPlayers.Model.FootballPlayer

  @default %{
    limit: nil,
    offset: nil,
    order_by: nil,
    player_name: "",
  }

  @type order_direction :: :desc | :asc

  @type order_field :: :total_rushing_yards | :longest_rush | :total_rushing_touchdowns

  @type list_params :: %{
    limit: integer(),
    offset: integer(),
    order_by: {order_direction(), order_field()}
  }

  @doc """
  Get all football players with limit and order
  """
  @spec all(author :: map(), list_params()) :: list(Location.t())
  def all(_author, options) do
    %{
      limit: limit,
      offset: offset,
      order_by: order_by,
      player_name: player_name,
    } = Enum.into(options, @default)

    from(t in FootballPlayer,
      where: ilike(t.player_name, ^"%#{player_name}%"),
      order_by: ^order_by,
      order_by: {:asc, :id},
      limit: ^limit,
      offset: ^offset)
    |> Repo.all()
  end

end
