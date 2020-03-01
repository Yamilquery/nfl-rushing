defmodule NflRushingWeb.Router do
  use NflRushingWeb, :router

  pipeline :graphql do
    plug(CORSPlug, origin: ["http://localhost:3000", "https://github.ist"])
    plug(:accepts, ["json"])
  end

  scope "/" do
    pipe_through(:graphql)

    forward("/graphql", Absinthe.Plug, schema: NflRushingWeb.Schema)

    forward("/graphiql", Absinthe.Plug.GraphiQL,
      schema: NflRushingWeb.Schema,
      interface: :playground
    )
  end

end
