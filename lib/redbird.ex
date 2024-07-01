defmodule Redbird do
  require Logger
  use Application

  def start(_type, _args) do
    redis_adapter_options = Redbird.Config.redis_adapter_options()
    redis_adapter = Redbird.Config.redis_adapter()
    redis_adapter_module_name = String.trim_leading(to_string(redis_adapter), "Elixir.")

    if Redbird.Adapter.Behaviour not in Keyword.get(
         redis_adapter.module_info(:attributes),
         :behaviour,
         []
       ) do
      Logger.warning(
        "The configured Redbird adapter #{redis_adapter_module_name} does not implement Redbird.Adapter.Behaviour."
      )
    end

    children =
      case redis_adapter.worker_spec(redis_adapter_options) do
        nil -> []
        worker_spec -> [worker_spec]
      end

    opts = [strategy: :one_for_one, name: Redbird.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
