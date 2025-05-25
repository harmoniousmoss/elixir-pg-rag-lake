defmodule UserAppWeb.PageController do
  use UserAppWeb, :controller

  @doc """
  Renders a plain-text welcome message at the root path.
  """
  def index(conn, _params) do
    # send_resp/3 lets us specify content type & body in one go
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Welcome to Phoenix framework!")
  end
end
