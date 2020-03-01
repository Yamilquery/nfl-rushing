defmodule NflRushingWeb.GraphQL.FootballPlayerTest do
  use NflRushingWeb.ConnCase

  import NflRushingWeb.TestSupport.GraphQLHelper

  @basic_query """
    query($playerName: String!) {
      football_players(
        playerName: $playerName,
        orderBy: {direction: DESC, field: TOTAL_RUSHING_YARDS}
      ) {
        player_name,
        team_abbreviation,
        player_position,
        rushing_attemps_per_game_avg,
        rushing_attemps,
        total_rushing_yards,
        rushing_average_yards_per_attempt,
        rushing_yards_per_game,
        total_rushing_touchdowns,
        longest_rush,
        rushing_first_downs,
        rushing_first_down_percentage,
        rushing_20_yards_each,
        rushing_40_yards_each,
        rushing_fumbles
      }
    }
  """

  test "returns basic data", %{conn: conn} do
    conn =
      conn
      |> put_graphql_headers()
      |> post("/graphql",
        %{query: @basic_query, variables: %{playerName: "a"}})

    assert %{
      "data" => %{
        "football_players" => [
          %{
            "longest_rush" => "7",
            "player_name" => "Joe Banyard",
            "player_position" => "RB",
            "rushing_20_yards_each" => 0.0,
            "rushing_40_yards_each" => 0.0,
            "rushing_attemps" => 2.0,
            "rushing_attemps_per_game_avg" => 2.0,
            "rushing_average_yards_per_attempt" => 3.0,
            "rushing_first_down_percentage" => 0.0,
            "rushing_first_downs" => 0.0,
            "rushing_fumbles" => 0.0,
            "rushing_yards_per_game" => 7.0,
            "team_abbreviation" => "JAX",
            "total_rushing_touchdowns" => 0.0,
            "total_rushing_yards" => 7.0
          },
          %{
            "longest_rush" => "7",
            "player_name" => "Shaun Hill",
            "player_position" => "QB",
            "rushing_20_yards_each" => 0.0,
            "rushing_40_yards_each" => 0.0,
            "rushing_attemps" => 2.0,
            "rushing_attemps_per_game_avg" => 2.0,
            "rushing_average_yards_per_attempt" => 3.0,
            "rushing_first_down_percentage" => 0.0,
            "rushing_first_downs" => 0.0,
            "rushing_fumbles" => 0.0,
            "rushing_yards_per_game" => 7.0,
            "team_abbreviation" => "MIN",
            "total_rushing_touchdowns" => 0.0,
            "total_rushing_yards" => 4.0
          }
        ]
      }
    } === json_response(conn, 200)
  end

end
