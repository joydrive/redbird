defmodule Redbird.Config do
  def redis_adapter do
    adapter =
      case Application.get_env(:redbird, :redis_adapter) do
        {module, _options} -> module
        module -> module
      end

    adapter || Redbird.Adapter.Redix
  end

  def redis_adapter_options do
    case Application.get_env(:redbird, :redis_adapter) do
      {_module, options} -> options
      _ -> []
    end
  end

  def key_base(conn) do
    base = Application.get_env(:redbird, :key_base) || conn.secret_key_base
    (base && {:ok, base}) || {:error, :key_base_not_found}
  end

  @default_signing_salt "redbird"
  def signing_salt do
    Application.get_env(:redbird, :signing_salt, @default_signing_salt)
  end
end
