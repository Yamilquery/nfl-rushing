defmodule NflRushingWeb.Schema do
  use Absinthe.Schema
  import_types NflRushingWeb.Queries.FootballPlayerQuery
  import_types NflRushingWeb.Schema.Enums
  import_types NflRushingWeb.Schema.FootballPlayers

  query do

    import_fields :football_players_query

  end

  mutation do
  end

end
