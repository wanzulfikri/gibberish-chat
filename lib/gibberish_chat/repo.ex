defmodule GibberishChat.Repo do
  use Ecto.Repo,
    otp_app: :gibberish_chat,
    adapter: Ecto.Adapters.Postgres
end
