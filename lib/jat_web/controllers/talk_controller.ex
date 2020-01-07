defmodule JatWeb.TalkController do
  use JatWeb, :controller

  alias Jat.Talks

  def show(conn, %{"id" => room}) do
    texts = Talks.list_texts_by_room(room)
    render(conn, "show.html", room: room, texts: texts)
  end

  # def index(conn, _params) do
  #   text_list = Jat.Talks.list_texts()
  #   render conn, "index.html", texts: text_list
  # end

end

# https://hexdocs.pm/phoenix/routing.html#resources
# user_path  GET     /users/:id       HelloWeb.UserController :show

# user_path  GET     /users           HelloWeb.UserController :index
# user_path  GET     /users/:id/edit  HelloWeb.UserController :edit
# user_path  GET     /users/new       HelloWeb.UserController :new
# user_path  GET     /users/:id       HelloWeb.UserController :show
# user_path  POST    /users           HelloWeb.UserController :create
# user_path  PATCH   /users/:id       HelloWeb.UserController :update
#            PUT     /users/:id       HelloWeb.UserController :update
# user_path  DELETE  /users/:id       HelloWeb.UserController :delete
