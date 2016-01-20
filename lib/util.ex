defmodule PhoenixJwt.Util do
  import Plug.Conn
  import Phoenix.Controller

  @doc """
  Create a random key which can be used to sign JWT or for random url safe string that is > 32 bytes
  """
	def random_key(length \\ 32) do
    gen_key(length)
	end

  def base_claims() do
    %{"iat"=> issued_at, "exp" => expires_at, "iss": Application.get_env(:phoenix_jwt, :token_issuer)}
  end

  def send_error(conn, errorMsg, status \\ 422) do
    conn
    |> put_status(status)
    |> json(%{error: errorMsg})
  end

  def repo do
    Application.get_env(:phoenix_jwt, :repo)
  end

  def model do
    Application.get_env(:phoenix_jwt, :user_model)
  end

  defp issued_at() do
    JwtClaims.Util.time_now
    |> Kernel.round
  end

  defp expires_at() do
    JwtClaims.Util.time_now + (Application.get_env(:phoenix_jwt, :token_expiry_mins) * 60)
    |> Kernel.round
  end

  defp gen_key(length) when length < 32 do
    {:error, "make a longer key, >= 32"}
  end

  defp gen_key(length) do
    {:ok, :crypto.strong_rand_bytes(length)
    |> Base.url_encode64
    |> binary_part(0, length)}
  end

end