# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :october2017,
  ecto_repos: [October2017.Repo]

# Configures the endpoint
config :october2017, October2017Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9JU8D3N8PlOWGHm2PyVbFxGiDKJw8RlIip4fFLBm+ewbXdKvNyJolgpwQl5b2xxX",
  render_errors: [view: October2017Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: October2017.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
