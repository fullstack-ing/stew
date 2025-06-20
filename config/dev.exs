import Config

# Configure your database
config :stew, Stew.Repo,
  database: Path.expand("../stew_dev.db", __DIR__),
  pool_size: 5,
  stacktrace: true,
  show_sensitive_data_on_connection_error: true
