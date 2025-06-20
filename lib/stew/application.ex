defmodule Stew.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Stew.Repo,
      {Ecto.Migrator,
       repos: Application.fetch_env!(:stew, :ecto_repos), skip: skip_migrations?()},
      {Bandit, plug: Stew.Router}
      # Starts a worker by calling: Stew.Worker.start_link(arg)
      # {Stew.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Stew.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp skip_migrations?() do
    # By default, sqlite migrations are run when using a release
    System.get_env("RELEASE_NAME") == nil
  end
end
