defmodule AdapterTest do
  use Redbird.ConnCase

  test "allows a redis adapter where the adapter does not spawn anything / where worker_spec returns nil" do
    defmodule TestAdapter do
      @behaviour Redbird.Adapter.Behaviour

      @impl true
      def worker_spec(_opts) do
        nil
      end

      @impl true
      def noreply_command(_command, _options \\ []), do: raise("Not implemented")

      @impl true
      def command(_command, _options \\ []), do: raise("Not implemented")
    end

    Application.stop(:redbird)

    Application.put_env(:redbird, :redis_adapter, TestAdapter)

    :ok = Application.start(:redbird)
  end
end
