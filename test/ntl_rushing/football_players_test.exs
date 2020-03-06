defmodule NflRushing.FootballPlayersTest do
  use ExUnit.Case
  doctest NflRushing
  alias NflRushing.FootballPlayers, as: FootballPlayers

  test "generate csv filtered by player's name" do
    assert FootballPlayers.generate_csv(%{
      "player_name" => "john b"
    }) === "Player\tTeam\tPos\tAtt/G\tAtt\tYds\tAvg\tYds/G\tTD\tLng\t1st\t1st%\t20+\t40+\tFUM\nJohn Brown\tARI\tWR\t0.1\t1\t10\t10\t0.7\t0\t10\t1\t100\t0\t0\t0"
  end

  test "list football players by name" do
    assert FootballPlayers.list_rushing(%{
      "player_name" => "john b"
    }) === [
      %{
        "1st" => 1,
        "1st%" => 100,
        "20+" => 0,
        "40+" => 0,
        "Att" => 1,
        "Att/G" => 0.1,
        "Avg" => 10,
        "FUM" => 0,
        "Lng" => "10",
        "Player" => "John Brown",
        "Pos" => "WR",
        "TD" => 0,
        "Team" => "ARI",
        "Yds" => 10,
        "Yds/G" => 0.7
      }
    ]
  end

  test "sort players up by Total Rushing Yards" do
    assert FootballPlayers.list_rushing(%{
      "player_name" => "john",
      "field" => "Yds",
      "direction" => "asc"
    }) === [
      %{
        "1st" => 1,
        "1st%" => 100,
        "20+" => 0,
        "40+" => 0,
        "Att" => 1,
        "Att/G" => 0.1,
        "Avg" => 10,
        "FUM" => 0,
        "Lng" => "10",
        "Player" => "John Brown",
        "Pos" => "WR",
        "TD" => 0,
        "Team" => "ARI",
        "Yds" => 10,
        "Yds/G" => 0.7
      },
      %{
        "1st" => 12,
        "1st%" => 66.7,
        "20+" => 0,
        "40+" => 0,
        "Att" => 18,
        "Att/G" => 1.1,
        "Avg" => 2.1,
        "FUM" => 0,
        "Lng" => "4",
        "Player" => "John Kuhn",
        "Pos" => "FB",
        "TD" => 4,
        "Team" => "NO",
        "Yds" => 37,
        "Yds/G" => 2.3
      },
      %{
        "1st" => 2,
        "1st%" => 33.3,
        "20+" => 1,
        "40+" => 0,
        "Att" => 6,
        "Att/G" => 0.4,
        "Avg" => 7.2,
        "FUM" => 1,
        "Lng" => "29",
        "Player" => "Johnny Holton",
        "Pos" => "WR",
        "TD" => 0,
        "Team" => "OAK",
        "Yds" => 43,
        "Yds/G" => 2.9
      },
      %{
        "1st" => 5,
        "1st%" => 20,
        "20+" => 0,
        "40+" => 0,
        "Att" => 25,
        "Att/G" => 6.2,
        "Avg" => 3.8,
        "FUM" => 0,
        "Lng" => "18",
        "Player" => "Chris Johnson",
        "Pos" => "RB",
        "TD" => 1,
        "Team" => "ARI",
        "Yds" => 95,
        "Yds/G" => 23.8
      },
      %{
        "1st" => 17,
        "1st%" => 23.3,
        "20+" => 2,
        "40+" => 0,
        "Att" => 73,
        "Att/G" => 4.6,
        "Avg" => 4.9,
        "FUM" => 1,
        "Lng" => "22",
        "Player" => "Duke Johnson",
        "Pos" => "RB",
        "TD" => 1,
        "Team" => "CLE",
        "Yds" => 358,
        "Yds/G" => 22.4
      },
      %{
        "1st" => 72,
        "1st%" => 24.6,
        "20+" => 6,
        "40+" => 2,
        "Att" => 293,
        "Att/G" => 18.3,
        "Avg" => 4.2,
        "FUM" => 5,
        "Lng" => "58T",
        "Player" => "David Johnson",
        "Pos" => "RB",
        "TD" => 16,
        "Team" => "ARI",
        "Yds" => "1,239",
        "Yds/G" => 77.4
      }
    ]
  end

  test "sort players down by Total Rushing Yards" do
    assert FootballPlayers.list_rushing(%{
      "player_name" => "john",
      "field" => "Yds",
      "direction" => "desc"
    }) === [
      %{
        "1st" => 72,
        "1st%" => 24.6,
        "20+" => 6,
        "40+" => 2,
        "Att" => 293,
        "Att/G" => 18.3,
        "Avg" => 4.2,
        "FUM" => 5,
        "Lng" => "58T",
        "Player" => "David Johnson",
        "Pos" => "RB",
        "TD" => 16,
        "Team" => "ARI",
        "Yds" => "1,239",
        "Yds/G" => 77.4
      },
      %{
        "1st" => 17,
        "1st%" => 23.3,
        "20+" => 2,
        "40+" => 0,
        "Att" => 73,
        "Att/G" => 4.6,
        "Avg" => 4.9,
        "FUM" => 1,
        "Lng" => "22",
        "Player" => "Duke Johnson",
        "Pos" => "RB",
        "TD" => 1,
        "Team" => "CLE",
        "Yds" => 358,
        "Yds/G" => 22.4
      },
      %{
        "1st" => 5,
        "1st%" => 20,
        "20+" => 0,
        "40+" => 0,
        "Att" => 25,
        "Att/G" => 6.2,
        "Avg" => 3.8,
        "FUM" => 0,
        "Lng" => "18",
        "Player" => "Chris Johnson",
        "Pos" => "RB",
        "TD" => 1,
        "Team" => "ARI",
        "Yds" => 95,
        "Yds/G" => 23.8
      },
      %{
        "1st" => 2,
        "1st%" => 33.3,
        "20+" => 1,
        "40+" => 0,
        "Att" => 6,
        "Att/G" => 0.4,
        "Avg" => 7.2,
        "FUM" => 1,
        "Lng" => "29",
        "Player" => "Johnny Holton",
        "Pos" => "WR",
        "TD" => 0,
        "Team" => "OAK",
        "Yds" => 43,
        "Yds/G" => 2.9
      },
      %{
        "1st" => 12,
        "1st%" => 66.7,
        "20+" => 0,
        "40+" => 0,
        "Att" => 18,
        "Att/G" => 1.1,
        "Avg" => 2.1,
        "FUM" => 0,
        "Lng" => "4",
        "Player" => "John Kuhn",
        "Pos" => "FB",
        "TD" => 4,
        "Team" => "NO",
        "Yds" => 37,
        "Yds/G" => 2.3
      },
      %{
        "1st" => 1,
        "1st%" => 100,
        "20+" => 0,
        "40+" => 0,
        "Att" => 1,
        "Att/G" => 0.1,
        "Avg" => 10,
        "FUM" => 0,
        "Lng" => "10",
        "Player" => "John Brown",
        "Pos" => "WR",
        "TD" => 0,
        "Team" => "ARI",
        "Yds" => 10,
        "Yds/G" => 0.7
      }
    ]
  end

  test "sort players up by Longest Rush" do
    assert FootballPlayers.list_rushing(%{
      "player_name" => "john",
      "field" => "Lng",
      "direction" => "asc"
    }) === [
      %{
        "1st" => 12,
        "1st%" => 66.7,
        "20+" => 0,
        "40+" => 0,
        "Att" => 18,
        "Att/G" => 1.1,
        "Avg" => 2.1,
        "FUM" => 0,
        "Lng" => "4",
        "Player" => "John Kuhn",
        "Pos" => "FB",
        "TD" => 4,
        "Team" => "NO",
        "Yds" => 37,
        "Yds/G" => 2.3
      },
      %{
        "1st" => 1,
        "1st%" => 100,
        "20+" => 0,
        "40+" => 0,
        "Att" => 1,
        "Att/G" => 0.1,
        "Avg" => 10,
        "FUM" => 0,
        "Lng" => "10",
        "Player" => "John Brown",
        "Pos" => "WR",
        "TD" => 0,
        "Team" => "ARI",
        "Yds" => 10,
        "Yds/G" => 0.7
      },
      %{
        "1st" => 5,
        "1st%" => 20,
        "20+" => 0,
        "40+" => 0,
        "Att" => 25,
        "Att/G" => 6.2,
        "Avg" => 3.8,
        "FUM" => 0,
        "Lng" => "18",
        "Player" => "Chris Johnson",
        "Pos" => "RB",
        "TD" => 1,
        "Team" => "ARI",
        "Yds" => 95,
        "Yds/G" => 23.8
      },
      %{
        "1st" => 17,
        "1st%" => 23.3,
        "20+" => 2,
        "40+" => 0,
        "Att" => 73,
        "Att/G" => 4.6,
        "Avg" => 4.9,
        "FUM" => 1,
        "Lng" => "22",
        "Player" => "Duke Johnson",
        "Pos" => "RB",
        "TD" => 1,
        "Team" => "CLE",
        "Yds" => 358,
        "Yds/G" => 22.4
      },
      %{
        "1st" => 2,
        "1st%" => 33.3,
        "20+" => 1,
        "40+" => 0,
        "Att" => 6,
        "Att/G" => 0.4,
        "Avg" => 7.2,
        "FUM" => 1,
        "Lng" => "29",
        "Player" => "Johnny Holton",
        "Pos" => "WR",
        "TD" => 0,
        "Team" => "OAK",
        "Yds" => 43,
        "Yds/G" => 2.9
      },
      %{
        "1st" => 72,
        "1st%" => 24.6,
        "20+" => 6,
        "40+" => 2,
        "Att" => 293,
        "Att/G" => 18.3,
        "Avg" => 4.2,
        "FUM" => 5,
        "Lng" => "58T",
        "Player" => "David Johnson",
        "Pos" => "RB",
        "TD" => 16,
        "Team" => "ARI",
        "Yds" => "1,239",
        "Yds/G" => 77.4
      }
    ]
  end

  test "sort players down by Longest Rush" do
    assert FootballPlayers.list_rushing(%{
      "player_name" => "john",
      "field" => "Lng",
      "direction" => "desc"
    }) === [
      %{
        "1st" => 72,
        "1st%" => 24.6,
        "20+" => 6,
        "40+" => 2,
        "Att" => 293,
        "Att/G" => 18.3,
        "Avg" => 4.2,
        "FUM" => 5,
        "Lng" => "58T",
        "Player" => "David Johnson",
        "Pos" => "RB",
        "TD" => 16,
        "Team" => "ARI",
        "Yds" => "1,239",
        "Yds/G" => 77.4
      },
      %{
        "1st" => 2,
        "1st%" => 33.3,
        "20+" => 1,
        "40+" => 0,
        "Att" => 6,
        "Att/G" => 0.4,
        "Avg" => 7.2,
        "FUM" => 1,
        "Lng" => "29",
        "Player" => "Johnny Holton",
        "Pos" => "WR",
        "TD" => 0,
        "Team" => "OAK",
        "Yds" => 43,
        "Yds/G" => 2.9
      },
      %{
        "1st" => 17,
        "1st%" => 23.3,
        "20+" => 2,
        "40+" => 0,
        "Att" => 73,
        "Att/G" => 4.6,
        "Avg" => 4.9,
        "FUM" => 1,
        "Lng" => "22",
        "Player" => "Duke Johnson",
        "Pos" => "RB",
        "TD" => 1,
        "Team" => "CLE",
        "Yds" => 358,
        "Yds/G" => 22.4
      },
      %{
        "1st" => 5,
        "1st%" => 20,
        "20+" => 0,
        "40+" => 0,
        "Att" => 25,
        "Att/G" => 6.2,
        "Avg" => 3.8,
        "FUM" => 0,
        "Lng" => "18",
        "Player" => "Chris Johnson",
        "Pos" => "RB",
        "TD" => 1,
        "Team" => "ARI",
        "Yds" => 95,
        "Yds/G" => 23.8
      },
      %{
        "1st" => 1,
        "1st%" => 100,
        "20+" => 0,
        "40+" => 0,
        "Att" => 1,
        "Att/G" => 0.1,
        "Avg" => 10,
        "FUM" => 0,
        "Lng" => "10",
        "Player" => "John Brown",
        "Pos" => "WR",
        "TD" => 0,
        "Team" => "ARI",
        "Yds" => 10,
        "Yds/G" => 0.7
      },
      %{
        "1st" => 12,
        "1st%" => 66.7,
        "20+" => 0,
        "40+" => 0,
        "Att" => 18,
        "Att/G" => 1.1,
        "Avg" => 2.1,
        "FUM" => 0,
        "Lng" => "4",
        "Player" => "John Kuhn",
        "Pos" => "FB",
        "TD" => 4,
        "Team" => "NO",
        "Yds" => 37,
        "Yds/G" => 2.3
      }
    ]
  end

  test "sort players down by Total Rushing Touchdowns" do
    assert FootballPlayers.list_rushing(%{
      "player_name" => "john",
      "field" => "TD",
      "direction" => "desc"
    }) === [
      %{
        "1st" => 72,
        "1st%" => 24.6,
        "20+" => 6,
        "40+" => 2,
        "Att" => 293,
        "Att/G" => 18.3,
        "Avg" => 4.2,
        "FUM" => 5,
        "Lng" => "58T",
        "Player" => "David Johnson",
        "Pos" => "RB",
        "TD" => 16,
        "Team" => "ARI",
        "Yds" => "1,239",
        "Yds/G" => 77.4
      },
      %{
        "1st" => 12,
        "1st%" => 66.7,
        "20+" => 0,
        "40+" => 0,
        "Att" => 18,
        "Att/G" => 1.1,
        "Avg" => 2.1,
        "FUM" => 0,
        "Lng" => "4",
        "Player" => "John Kuhn",
        "Pos" => "FB",
        "TD" => 4,
        "Team" => "NO",
        "Yds" => 37,
        "Yds/G" => 2.3
      },
      %{
        "1st" => 5,
        "1st%" => 20,
        "20+" => 0,
        "40+" => 0,
        "Att" => 25,
        "Att/G" => 6.2,
        "Avg" => 3.8,
        "FUM" => 0,
        "Lng" => "18",
        "Player" => "Chris Johnson",
        "Pos" => "RB",
        "TD" => 1,
        "Team" => "ARI",
        "Yds" => 95,
        "Yds/G" => 23.8
      },
      %{
        "1st" => 17,
        "1st%" => 23.3,
        "20+" => 2,
        "40+" => 0,
        "Att" => 73,
        "Att/G" => 4.6,
        "Avg" => 4.9,
        "FUM" => 1,
        "Lng" => "22",
        "Player" => "Duke Johnson",
        "Pos" => "RB",
        "TD" => 1,
        "Team" => "CLE",
        "Yds" => 358,
        "Yds/G" => 22.4
      },
      %{
        "1st" => 1,
        "1st%" => 100,
        "20+" => 0,
        "40+" => 0,
        "Att" => 1,
        "Att/G" => 0.1,
        "Avg" => 10,
        "FUM" => 0,
        "Lng" => "10",
        "Player" => "John Brown",
        "Pos" => "WR",
        "TD" => 0,
        "Team" => "ARI",
        "Yds" => 10,
        "Yds/G" => 0.7
      },
      %{
        "1st" => 2,
        "1st%" => 33.3,
        "20+" => 1,
        "40+" => 0,
        "Att" => 6,
        "Att/G" => 0.4,
        "Avg" => 7.2,
        "FUM" => 1,
        "Lng" => "29",
        "Player" => "Johnny Holton",
        "Pos" => "WR",
        "TD" => 0,
        "Team" => "OAK",
        "Yds" => 43,
        "Yds/G" => 2.9
      }
    ]
  end

  test "sort players up by Total Rushing Touchdowns" do
    assert FootballPlayers.list_rushing(%{
      "player_name" => "john",
      "field" => "TD",
      "direction" => "asc"
    }) === [
      %{
        "1st" => 2,
        "1st%" => 33.3,
        "20+" => 1,
        "40+" => 0,
        "Att" => 6,
        "Att/G" => 0.4,
        "Avg" => 7.2,
        "FUM" => 1,
        "Lng" => "29",
        "Player" => "Johnny Holton",
        "Pos" => "WR",
        "TD" => 0,
        "Team" => "OAK",
        "Yds" => 43,
        "Yds/G" => 2.9
      },
      %{
        "1st" => 1,
        "1st%" => 100,
        "20+" => 0,
        "40+" => 0,
        "Att" => 1,
        "Att/G" => 0.1,
        "Avg" => 10,
        "FUM" => 0,
        "Lng" => "10",
        "Player" => "John Brown",
        "Pos" => "WR",
        "TD" => 0,
        "Team" => "ARI",
        "Yds" => 10,
        "Yds/G" => 0.7
      },
      %{
        "1st" => 17,
        "1st%" => 23.3,
        "20+" => 2,
        "40+" => 0,
        "Att" => 73,
        "Att/G" => 4.6,
        "Avg" => 4.9,
        "FUM" => 1,
        "Lng" => "22",
        "Player" => "Duke Johnson",
        "Pos" => "RB",
        "TD" => 1,
        "Team" => "CLE",
        "Yds" => 358,
        "Yds/G" => 22.4
      },
      %{
        "1st" => 5,
        "1st%" => 20,
        "20+" => 0,
        "40+" => 0,
        "Att" => 25,
        "Att/G" => 6.2,
        "Avg" => 3.8,
        "FUM" => 0,
        "Lng" => "18",
        "Player" => "Chris Johnson",
        "Pos" => "RB",
        "TD" => 1,
        "Team" => "ARI",
        "Yds" => 95,
        "Yds/G" => 23.8
      },
      %{
        "1st" => 12,
        "1st%" => 66.7,
        "20+" => 0,
        "40+" => 0,
        "Att" => 18,
        "Att/G" => 1.1,
        "Avg" => 2.1,
        "FUM" => 0,
        "Lng" => "4",
        "Player" => "John Kuhn",
        "Pos" => "FB",
        "TD" => 4,
        "Team" => "NO",
        "Yds" => 37,
        "Yds/G" => 2.3
      },
      %{
        "1st" => 72,
        "1st%" => 24.6,
        "20+" => 6,
        "40+" => 2,
        "Att" => 293,
        "Att/G" => 18.3,
        "Avg" => 4.2,
        "FUM" => 5,
        "Lng" => "58T",
        "Player" => "David Johnson",
        "Pos" => "RB",
        "TD" => 16,
        "Team" => "ARI",
        "Yds" => "1,239",
        "Yds/G" => 77.4
      }
    ]
  end

end
