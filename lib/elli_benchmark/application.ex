defmodule ElliBenchmark.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
    ]
    elli_opts = [{:callback, ElliBenchmark.Router}, {:port, 3000}]
    :elli.start_link(elli_opts)

    opts = [strategy: :one_for_one, name: ElliBenchmark.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
