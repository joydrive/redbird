defmodule Redbird.Adapter.Behaviour do
  @type command :: [String.Chars.t()]

  @callback start_link(any()) :: {:ok, pid()} | :ignore | {:error, term()}

  @callback noreply_command(command(), keyword()) :: {:ok, any()} | {:error, any()}

  @callback command(command(), keyword()) :: {:ok, any()} | {:error, any()}
end
