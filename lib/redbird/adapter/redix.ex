if Code.ensure_loaded?(Redix) do
  defmodule Redbird.Adapter.Redix do
    @behaviour Redbird.Adapter.Behaviour

    def child_spec(args) do
      %{
        id: __MODULE__,
        start: {__MODULE__, :start_link, [args]}
      }
    end

    @impl true
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
