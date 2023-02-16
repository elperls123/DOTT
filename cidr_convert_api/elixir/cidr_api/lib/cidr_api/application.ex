defmodule CidrApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      { Plug.Cowboy, [ scheme: :http, plug: Api.Endpoints, options: [port: 8000, ip: {0,0,0,0}] ]}
    ]
    opts = [strategy: :one_for_one, name: CidrApi.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
