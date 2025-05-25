defmodule UserApp.Repo do
  use Ecto.Repo,
    otp_app: :user_app,
    adapter: Ecto.Adapters.Postgres
end
