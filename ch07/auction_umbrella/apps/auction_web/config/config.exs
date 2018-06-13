# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :auction_web,
  namespace: AuctionWeb,
  ecto_repos: [AuctionWeb.Repo]

# Configures the endpoint
config :auction_web, AuctionWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "lnmR7IUjjt4FKCPGxrCpkGqxTxlzoRJHVvXEcfe9aEFwSGA+EciGB31+GIpSodOi",
  render_errors: [view: AuctionWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AuctionWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :auction_web, :generators,
  context_app: false

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
