if Code.ensure_loaded?(Redix) do
  defmodule Redbird.Adapter.Redix do
    @behaviour Redbird.Adapter.Behaviour

    @impl true
    def worker_spec(opts) do
      %{
        id: __MODULE__,
        start: {__MODULE__, :start_link, [opts]}
      }
    end

    def start_link(opts) do
      Redix.start_link(opts ++ [name: __MODULE__])
    end

    @impl true
    def noreply_command(command, options \\ []) do
      Redix.noreply_command(__MODULE__, command, options)
    end

    @impl true
    def command(command, options \\ []) do
      Redix.command(__MODULE__, command, options)
    end
  end
end
