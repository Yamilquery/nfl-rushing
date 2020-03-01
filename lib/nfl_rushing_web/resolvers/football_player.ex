defmodule NflRushingWeb.Resolvers.FootballPlayerResolver do

  alias NflRushing.ArgumentParser

  def all(author, args, _resolution) do
    args =
      args
      |> ArgumentParser.parse_limit(max_limit: 100)
      |> ArgumentParser.parse_order_by()

    {:ok, NflRushing.FootballPlayers.all(author, args)}
  end

end
