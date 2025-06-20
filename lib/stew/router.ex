defmodule Stew.Router do
  use Plug.Router

  alias Stew.Controller

  plug(:match)
  plug(:dispatch)

  get "/posts" do
    conn
    |> Controller.posts()
    |> handle_response()
  end

  get "/posts/:slug.json" do
    conn
    |> Controller.post()
    |> handle_response()
  end

  get "/hello/:name" do
    conn
    |> Controller.hello()
    |> handle_response()
  end

  match _ do
    not_found(conn)
  end

  def handle_response({:ok, resp, conn}), do: send_resp(conn, 200, resp)
  def handle_response({:error, conn}), do: not_found(conn)

  def not_found(conn) do
    send_resp(conn, 404, "oops")
  end
end
