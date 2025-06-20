defmodule Stew.Repo do
  use Ecto.Repo,
    otp_app: :stew,
    adapter: Ecto.Adapters.SQLite3
end
