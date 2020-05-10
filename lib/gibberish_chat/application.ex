defmodule GibberishChat.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      GibberishChat.Repo,
      # Start the Telemetry supervisor
      GibberishChatWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: GibberishChat.PubSub},
      # Start the Endpoint (http/https)
      GibberishChatWeb.Endpoint
      # Start a worker by calling: GibberishChat.Worker.start_link(arg)
      # {GibberishChat.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GibberishChat.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    GibberishChatWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
