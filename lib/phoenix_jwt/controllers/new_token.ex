defmodule PhoenixJwt.Controllers.NewToken do
    use Phoenix.Controller
        
    def create(conn, %{"username" => username, "password" => password}) do
      IO.puts "username: #{} - password: #{}"
      json conn, %{token: PhoenixJwt.generate_token }
    end

    def refresh(conn, %{"token" => token}) do
      json conn, %{"new_token": token}
    end

end
