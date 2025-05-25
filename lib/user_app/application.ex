defmodule UserApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      UserAppWeb.Telemetry,
      UserApp.Repo,
      {DNSCluster, query: Application.get_env(:user_app, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: UserApp.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: UserApp.Finch},
      # Start a worker by calling: UserApp.Worker.start_link(arg)
      # {UserApp.Worker, arg},
      # Start to serve requests, typically the last entry
      UserAppWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: UserApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    UserAppWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
