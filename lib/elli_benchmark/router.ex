defmodule ElliBenchmark.Router do
  @behaviour :elli_handler

  require Record
  Record.defrecord(:req, Record.extract(:req, from_lib: "elli/include/elli.hrl"))

  def handle(req, _args) do
    handle(req(req)[:method], :elli_request.path(req), req)
  end

  def handle(:GET, ["hello", "world"], _) do
    {:ok, [], "Hello World!"}
  end

  def handle(_, _, _req) do
    {404, [], "Not Found"}
  end

  def handle_event(_event, _data, _arts), do: :ok
end

