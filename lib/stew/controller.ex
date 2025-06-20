defmodule Stew.Controller do
  alias Plug.Conn
  alias Stew.Blog

  def hello(%{params: %{"name" => name}} = conn) do
    Conn.send_resp(conn, 200, "hello #{name}")
  end

  def posts(conn) do
    posts = Blog.list_posts() |> JSON.encode!()
    Conn.send_resp(conn, 200, posts)
  end

  def post(%{params: %{"slug" => slug}} = conn) do
    case Blog.get_post(slug) do
      nil -> Conn.send_resp(conn, 404, "oops")
      post -> Conn.send_resp(conn, 200, post |> JSON.encode!())
    end
  end
end
