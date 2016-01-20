defmodule PhoenixJwt.Mixfile do
  use Mix.Project

  def project do
    [app: :phoenix_jwt,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: applications(Mix.env)]
  end

defp applications(:test), do: applications(:all) ++ [:blacksmith]
defp applications(_all),  do: [:logger, :phoenix, :cowboy, :comeonin]

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [ {:json_web_token, "~> 0.2.4"},
      {:jwt_claims, "~> 0.0.3"},
      {:phoenix, "~> 1.1"},
      {:ecto, "~> 1.1"},
      {:comeonin, "~> 2.0"},
      {:cowboy, "~> 1.0"},
      {:postgrex, "~> 0.10.0"},
      {:earmark, "~> 0.2.1", only: :dev},
      {:ex_doc, "~> 0.11.3", only: :dev},
      {:blacksmith, "~> 0.1.3", only: :test},
    ]
  end
end
