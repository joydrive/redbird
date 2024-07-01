defmodule Redbird.Redis do
  alias Redbird.Config

  def get(key) do
    ["GET", key]
    |> Config.redis_adapter().command()
    |> case do
      {:ok, nil} -> :undefined
      {:ok, response} -> response
    end
  end

  def setex(%{key: key, value: value, seconds: seconds}) do
    ["SETEX", key, seconds, value]
    |> Config.redis_adapter().command()
    |> case do
      {:ok, "OK"} -> :ok
      {:error, error} -> error
    end
  end

  def del(keys) when is_list(keys) do
    Config.redis_adapter().noreply_command(["DEL" | keys])
  end

  def del(key) when is_binary(key) do
    del([key])
  end

  def keys(pattern) do
    case Config.redis_adapter().command(["KEYS", pattern]) do
      {:ok, value} -> value
      {:error, error} -> raise error
    end
  end
end
