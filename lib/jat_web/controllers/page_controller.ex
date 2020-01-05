defmodule JatWeb.PageController do
  use JatWeb, :controller

  def index(conn, _params) do
    message_list = Jat.Chats.list_messages()
    render conn, "index.html", messages: message_list
  end
end
