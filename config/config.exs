import Config

config :cursus,
  ecto_repos: [Cursus.Repo]

config :cursus, Cursus.Repo,
  database: "cursus_dev",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  migration_primary_key: [name: :id, type: :binary_id]
