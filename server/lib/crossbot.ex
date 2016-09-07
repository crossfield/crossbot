defmodule Crossbot do
  use Application

  def start(_type, _args) do
    Crossbot.Supervisor.start_link
  end
end
