defmodule Jat.Repo do
  use Ecto.Repo,
    otp_app: :jat,
    adapter: Ecto.Adapters.Postgres
end
