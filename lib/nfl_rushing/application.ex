defmodule NflRushing.Application do
  use Application

  def start(_type, _args) do
    children = [
      NflRushing.Endpoint
    ]

    opts = [strategy: :one_for_one, name: NflRushing.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
