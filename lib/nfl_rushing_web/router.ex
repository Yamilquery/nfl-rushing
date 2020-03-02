defmodule NflRushingWeb.Router do
  use NflRushingWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :graphql do
    plug(CORSPlug, origin: ["http://localhost:4000", "https://github.ist"])
    plug(:accepts, ["json"])
  end

  scope "/" do
    pipe_through(:graphql)

    forward("/graphql", Absinthe.Plug, schema: NflRushingWeb.Schema)
  end

  scope "/", NflRushingWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

end
