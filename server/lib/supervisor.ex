defmodule Crossbot.Supervisor do
  require Logger

  use Supervisor

  @name Crossbot.Supervisor

  def start_link do
    Logger.info "Starting Supervisor"
    Supervisor.start_link(__MODULE__, :ok, name: @name)
  end

  def init(:ok) do
    children = [
      worker(Task, [Crossbot.Server, :accept, [4000]])
    ]

    supervise(children, strategy: :one_for_one)
  end
end
