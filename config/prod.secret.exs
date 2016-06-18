use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :hello_semaphore, HelloSemaphore.Endpoint,
  secret_key_base: "gFVfYqPW2qtC0xaY81aB6kMt1o5G7O3ehhg9t0JoRiZPMI0Yzhzj0burL3wVqtmw"

# Configure your database
config :hello_semaphore, HelloSemaphore.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  hostname: "postgres",
  database: "hello_semaphore_prod",
  pool_size: 20
