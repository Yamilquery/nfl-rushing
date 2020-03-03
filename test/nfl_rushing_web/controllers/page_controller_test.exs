defmodule NflRushingWeb.PageControllerTest do
  use NflRushingWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200)
  end

  test "GET /download-csv", %{conn: conn} do
    conn = get(conn, "/download-csv")
    assert response(conn, 200)
  end
end
