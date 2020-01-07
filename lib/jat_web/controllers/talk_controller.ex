defmodule JatWeb.TalkController do
  use JatWeb, :controller

  def show(conn, %{"id" => roomid}) do
    render(conn, "show.html", room: roomid)
  end

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
