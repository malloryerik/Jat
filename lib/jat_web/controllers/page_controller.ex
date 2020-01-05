defmodule JatWeb.PageController do
  use JatWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
