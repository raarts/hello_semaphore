defmodule Mix.Tasks.Compose do
  use Mix.Task

  @shortdoc "Run Docker Compose to start up an orchestrated multi-container runtime of this project"

  def run(args) do
    case Mix.shell.cmd("docker-compose version", [quiet: true]) do
      0 ->
        compose(args)
      _err -> Mix.shell.error "docker-compose executable not found. Installation page: https://docs.docker.com/compose/install"
    end
  end

  def compose(["up"]) do
    Mix.shell.info "Start time!"
    Mix.shell.cmd("sudo docker-compose up")
  end

  def compose(["down"]) do
    Mix.shell.info "Stop time!"
    Mix.shell.cmd("sudo docker-compose down")
  end

  def compose(["release", env]) do
    Mix.shell.info "Release and start time!"
    System.put_env("MIX_ENV", env)
    Mix.shell.cmd "mix compile"
    Mix.shell.cmd "mix release"
  end

  def compose(["build"]) do
    version = Keyword.fetch!(Mix.Project.config, :version)
    Mix.shell.info "Version: #{version}"
    Mix.shell.cmd "sudo docker build -t hellosemaphore_web --build-arg VERSION=#{version} ."
  end 

end
