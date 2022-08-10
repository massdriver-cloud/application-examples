defmodule K8sElixirPostgres.Repo do
  use Ecto.Repo,
    otp_app: :k8s_elixir_postgres,
    adapter: Ecto.Adapters.Postgres
end
