defmodule HelloSemaphore.Repo do
  use Ecto.Repo, otp_app: :hello_semaphore

  #def init(_) do
  #  run_migrations
  #  {:ok, self}
  #end

  #def run_migrations do
  #  migrations_path = __MODULE__.config()
  #              |> Keyword.fetch!(:otp_app)
  #              |> Application.app_dir()
  #              |> Path.join("priv")
  #              |> Path.join("repo")
  #              |> Path.join("migrations")
  #  IO.puts "migrations path: #{inspect migrations_path}"
  #  Ecto.Migrator.run(__MODULE__, migrations_path, :up, [all: true])
  #end 
end
