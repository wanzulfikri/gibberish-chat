# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :gibberish_chat,
  ecto_repos: [GibberishChat.Repo]

# Configures the endpoint
config :gibberish_chat, GibberishChatWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/BYplfI6JB/jXWzLYfIpogyoZc0u7BB4dE/I0ZmFEH8cKFJzTDHQvF1pOT97loLS",
  render_errors: [view: GibberishChatWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: GibberishChat.PubSub,
  live_view: [signing_salt: "M3vYwzLK"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
