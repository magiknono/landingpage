defmodule Landingpage.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: Landingpage.Worker.start_link(arg)
      # {Landingpage.Worker, arg}
      {Plug.Cowboy, scheme: :http, plug: Landingpage.Router, options: [port: 4000]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Landingpage.Supervisor]
    Logger.info("Starting application...")
    Supervisor.start_link(children, opts)
  end
end
