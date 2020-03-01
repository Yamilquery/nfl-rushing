defmodule NflRushingWeb.Schema.Enums do
  @moduledoc """
  Enums that used in all across the schema
  """

  use Absinthe.Schema.Notation

  enum :football_player_order_field do
    value(:total_rushing_yards)
    value(:longest_rush)
    value(:total_rushing_touchdowns)
  end

  enum :order_direction do
    value(:asc)
    value(:desc)
  end
end
