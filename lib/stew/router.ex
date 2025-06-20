defmodule Stew.Router do
  use Plug.Router

  alias Stew.Controller

  plug(:match)
  plug(:dispatch)

  get "/posts" do
    Controller.posts(conn)
  end

  get "/posts/:slug" do
    Controller.post(conn)
  end

  get "/hello/:name" do
    Controller.hello(conn)
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
