defmodule PhoenixJwt.Controllers.AuthToken do
  use Phoenix.Controller
  import Plug.Conn, only: [get_req_header: 2, send_resp: 3, halt: 1]
  import Application, only: [get_env: 2]
    
    def validate(conn, _opts) do
      case get_req_header(conn, "authorization") |> check_token do
        {:error, msg} -> 
          conn |> json(%{error: "NOPE #{msg}"}) 
        {:ok, claims} ->
          IO.inspect claims
          conn 
      end
    end 

    defp check_token(incoming_token) when incoming_token == [], do: {:error, "no token"}
    defp check_token(incoming_token) do
      strip_bearer(incoming_token) 
      |> JwtClaims.verify(%{iss: get_env(:phoenix_jwt, :token_issuer), key: get_env(:phoenix_jwt, :secret)})   
    end

    defp strip_bearer(incoming_token) do
      case incoming_token do
        ["Bearer " <> token] -> token
        [token] -> token
      end
    end




end

