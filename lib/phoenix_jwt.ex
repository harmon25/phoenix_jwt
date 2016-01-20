defmodule PhoenixJwt do
  def generate_token(claims \\ %{}) do
    PhoenixJwt.Util.base_claims
    |> Map.merge(claims)
    |> JsonWebToken.sign(%{alg: Application.get_env(:phoenix_jwt, :alg), key: Application.get_env(:phoenix_jwt, :secret)})
  end
end
