# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ex_survey,
  ecto_repos: [ExSurvey.Repo]

# Configures the endpoint
config :ex_survey, ExSurveyWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "L1qwq0xEnUWvJ0nby8Qov2zCYqbVKvlwQ2rYqBTI/RFMDetV3DKDAQ+DC07L2kCi",
  render_errors: [view: ExSurveyWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ExSurvey.PubSub,
  live_view: [signing_salt: "v5EK25jQ"],
  live_reload: [
    iframe_attrs: [
      class: "hidden"
    ]
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
