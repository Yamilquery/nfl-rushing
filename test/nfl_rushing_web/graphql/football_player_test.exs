defmodule NflRushingWeb.GraphQL.FootballPlayerTest do
  use NflRushingWeb.ConnCase

  import NflRushingWeb.TestSupport.GraphQLHelper

  @order_query """
    query($direction: String, $field: String) {
      football_players(
        orderBy: {direction: $direction, field: $field}
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
        longest_rush_touchdown,
        rushing_first_downs,
        rushing_first_down_percentage,
        rushing_20_yards_each,
        rushing_40_yards_each,
        rushing_fumbles
      }
    }
  """

  @limit_query """
    query($limit: Int, $offset: Int) {
      football_players(
        limit: $limit,
        offset: $offset
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
        longest_rush_touchdown,
        rushing_first_downs,
        rushing_first_down_percentage,
        rushing_20_yards_each,
        rushing_40_yards_each,
        rushing_fumbles
      }
    }
  """

  @player_name_query """
    query($playerName: String) {
      football_players(
        playerName: $playerName
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
        longest_rush_touchdown,
        rushing_first_downs,
        rushing_first_down_percentage,
        rushing_20_yards_each,
        rushing_40_yards_each,
        rushing_fumbles
      }
    }
  """

  test "Sort the players by Total Rushing Yards", %{conn: conn} do
    conn =
      conn
      |> put_graphql_headers()
      |> post("/graphql",
        %{
          query: @order_query,
          variables: %{
            direction: "DESC",
            field: "TOTAL_RUSHING_YARDS"
          }
        }
      )

      assert %{
        "data" => %{
          "football_players" => _players
        }
      } = json_response(conn, 200)
  end

  test "Sort the players by Longest Rush", %{conn: conn} do
    conn =
      conn
      |> put_graphql_headers()
      |> post("/graphql",
        %{
          query: @order_query,
          variables: %{
            direction: "DESC",
            field: "LONGEST_RUSH"
          }
        }
      )

    assert %{
      "data" => %{
        "football_players" => _players
      }
    } = json_response(conn, 200)
  end

  test "Sort the players by Total Rushing Touchdowns", %{conn: conn} do
    conn =
      conn
      |> put_graphql_headers()
      |> post("/graphql",
        %{
          query: @order_query,
          variables: %{
            direction: "DESC",
            field: "TOTAL_RUSHING_TOUCHDOWNS"
          }
        }
      )

    assert %{
      "data" => %{
        "football_players" => _players
      }
    } = json_response(conn, 200)
  end

  test "Limit to one player", %{conn: conn} do
    conn =
      conn
      |> put_graphql_headers()
      |> post("/graphql",
        %{
          query: @limit_query,
          variables: %{
            limit: 1,
            offset: 1
          }
        }
      )

    assert %{
      "data" => %{
        "football_players" => _players
      }
    } = json_response(conn, 200)
  end

  test "Sort the players by an Invalid field", %{conn: conn} do
    conn =
      conn
      |> put_graphql_headers()
      |> post("/graphql",
        %{
          query: @order_query,
          variables: %{
            direction: "DESC",
            field: "INVALID_FIELD"
          }
        }
      )

    assert %{
      "errors" => [
        %{
          "locations" => [
            %{"column" => 0, "line" => 3}
          ],
          "message" =>
          "Argument \"orderBy\" has invalid value {direction: $direction, field: $field}.\nIn field \"field\": Expected type \"FootballPlayerOrderField!\", found $field."
        }
      ]
    } = json_response(conn, 200)
  end

  test "Filter by the player's name", %{conn: conn} do
    conn =
      conn
      |> put_graphql_headers()
      |> post("/graphql",
        %{
          query: @player_name_query,
          variables: %{
            playerName: "Yamil Díaz"
          }
        }
      )

    assert %{
      "data" => %{
        "football_players" => [_player]
      }
    } = json_response(conn, 200)
  end

end
