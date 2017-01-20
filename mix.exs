defmodule MyEx.Mixfile do
  use Mix.Project

  def project, do: [
    app: :myex,
    version: "0.1.0",
    elixir: "~> 1.4",
    build_embedded: Mix.env == :prod,
    start_permanent: Mix.env == :prod,
    elixirc_paths: ["myex.ex"],
    escript: [main_module: MyEx],
    deps: deps(),
  ]

  def application, do: [
    extra_applications: [:logger],
  ]

  # Add extra dependencies here to experiment with them in your `myex` environment.
  #
  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  #
  defp deps, do: [

  ]

end
