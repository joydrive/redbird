defmodule Redbird.Redis do
  def get(key) do
    pool_module().command(["GET", key])
    |> case do
      {:ok, nil} -> :undefined
      {:ok, response} -> response
    end
  end

  def setex(%{key: key, value: value, seconds: seconds}) do
    pool_module().command(["SETEX", key, seconds, value])
    |> case do
      {:ok, "OK"} -> :ok
      {:error, error} -> error
    end
  end

  def del(keys) when is_list(keys) do
    pool_module().noreply_command(["DEL" | keys])
  end

  def del(key) when is_binary(key) do
    del([key])
  end

  def keys(pattern) do
    pool_module().command!(["KEYS", pattern])
  end

  def pool_module do
    Application.get_env(:redbird, :pool_module)
  end
end
