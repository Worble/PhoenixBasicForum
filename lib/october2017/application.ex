defmodule October2017.Application do
  use Application

  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [
      # Start the Ecto repository
      supervisor(October2017.Repo, []),
      # Start the endpoint when the application starts
      supervisor(October2017Web.Endpoint, []),
      # Start your own worker by calling: October2017.Worker.start_link(arg1, arg2, arg3)
      # worker(October2017.Worker, [arg1, arg2, arg3]),
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: October2017.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    October2017Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
