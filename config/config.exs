# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :jat,
  ecto_repos: [Jat.Repo]

# Configures the endpoint
config :jat, JatWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "92wYysqh416lTxmHLm1A3JDT2o/QtZuT1bWsc0aMdbHTcoIgfKf2V0rDsh9Fi5mY",
  render_errors: [view: JatWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Jat.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
