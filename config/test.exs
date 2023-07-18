import Config

# Only in tests, remove the complexity from the password hashing algorithm
config :bcrypt_elixir, :log_rounds, 1

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
database_url =
  System.get_env("DATABASE_URL") ||
    "ecto://wrench_api:wrench_api:localhost:5432/wrench_api_test#{System.get_env("MIX_TEST_PARTITION")}"

config :wrench_api, WrenchApi.Repo, url: database_url

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :wrench_api, WrenchApiWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "gG6d7V6XF4hnVgwpnaPOoUr5iTiChuuFZ6NALhLeB2sGm5rOyFHUJ2lSclrObduM",
  server: false

# In test we don't send emails.
config :wrench_api, WrenchApi.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
