defmodule MyEx do
  @moduledoc """
  CLI for MyEx.
  """

  @doc """
  Executes commands within `$MYEX_DIR` (default: `~/.myex`).

  If no options are given, will start an `iex` session there.
  """
  def main([]), do: main(["iex", "-S", "mix"])
  def main([cmd | args]) do
    IO.puts("Running in #{project_dir()}: #{cmd} #{args |> Enum.join(" ")}...")
    System.cmd(cmd, args,
      cd: project_dir(),
      stderr_to_stdout: true,
      into: IO.stream(:stdio, :line),
    )
  end

  def project_dir() do
    System.get_env("MYEX_DIR") || System.user_home! |> Path.join(".myex")
  end
end

defmodule Mix.Tasks.Myex.Install do
  @moduledoc """
  Installer for MyEx.
  """
  @shortdoc "Installs MyEx"

  use Mix.Task

  import MyEx, only: [project_dir: 0]

  @doc """
  Ensures a `mix.exs` file exists into `$MYEX_DIR` (default: `~/.myex`).

  Uses `MyEx`'s `Mixfile` and prompts on overwrite.
  """
  def run(_) do
    Mix.shell.info("Installing MyEx to #{project_dir()}...")
    Mix.Generator.create_file(Path.join(project_dir(), "mix.exs"), File.read!("mix.exs"))
  end
end
