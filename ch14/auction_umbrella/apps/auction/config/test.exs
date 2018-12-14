use Mix.Config

config :auction, Auction.Repo,
  username: "postgres",
  password: "postgres",
  database: "auction_test",
  hostname: "localhost",
  port: "5432",
  pool: Ecto.Adapters.SQL.Sandbox

config :logger, level: :info
