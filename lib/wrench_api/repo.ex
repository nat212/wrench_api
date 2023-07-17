defmodule WrenchApi.Repo do
  use Ecto.Repo,
    otp_app: :wrench_api,
    adapter: Ecto.Adapters.Postgres
end
