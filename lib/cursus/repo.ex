defmodule Cursus.Repo do
  use Ecto.Repo,
    otp_app: :cursus,
    adapter: Ecto.Adapters.Postgres
end
