defmodule NflRushingWeb.Queries.FootballPlayerQuery do
  @moduledoc false
  use Absinthe.Schema.Notation

  object :football_players_query do
    field :football_players, list_of(:football_player) do
      @desc "Order type"
      arg(:order_by, :football_player_order)

      @desc "Player name"
      arg(:player_name, :string)

      @desc "Limit of results"
      arg(:limit, :integer, default_value: 81)

      @desc "Offset for pagination"
      arg(:offset, :integer, default_value: 0)
      resolve &NflRushingWeb.Resolvers.FootballPlayerResolver.all/3
    end
  end

end
