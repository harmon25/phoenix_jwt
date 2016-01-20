use Mix.Config

config :phoenix_jwt,
  secret: "MkKdWQ2slqzn3iTd4pLhQPoEikh+wPXM",
  token_expiry_mins: 10,  # 7 * 24 * 60  = 1 week
  token_issuer: "an issuer",
  alg: "HS256",
  repo: PhoenixJwt.TestRepo,
  user_model: PhoenixJwt.User


config :phoenix_jwt, PhoenixJwt.TestRepo,
  username: "postgres",
  password: "postgres",
  adapter: Ecto.Adapters.Postgres,
  pool: Ecto.Adapters.SQL.Sandbox,
  url: "ecto://localhost/phoenix_jwt_test",
  size: 1,
  max_overflow: 0

config :logger, level: :warn