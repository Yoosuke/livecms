defmodule Livecms.Repo do
  use Ecto.Repo,
    otp_app: :livecms,
    adapter: Ecto.Adapters.Postgres
end
