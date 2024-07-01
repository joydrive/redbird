defmodule Redbird.Adapter.Behaviour do
  @type command :: [String.Chars.t()]

  @callback worker_spec(keyword()) :: Supervisor.child_spec() | nil

  @callback noreply_command(command(), keyword()) :: {:ok, any()} | {:error, any()}

  @callback command(command(), keyword()) :: {:ok, any()} | {:error, any()}
end
