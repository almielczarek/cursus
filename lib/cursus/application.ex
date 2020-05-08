defmodule Cursus.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Cursus.Worker.start_link(arg)
      # {Cursus.Worker, arg}
      {Cursus.Repo, []}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Cursus.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
