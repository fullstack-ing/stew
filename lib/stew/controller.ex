defmodule Stew.Controller do
  alias Stew.Blog

  def hello(%{params: %{"name" => name}} = conn) do
    {:ok, "Hello #{name}", conn}
  end

  def posts(conn) do
    {:ok, Blog.list_posts() |> JSON.encode!(),
     Plug.Conn.put_resp_content_type(conn, "application/json")}
  end

  def post(%{params: %{"slug" => slug}} = conn) do
    case Blog.get_post(slug) do
      nil ->
        {:error, conn}

      post ->
        {:ok, post |> JSON.encode!(), Plug.Conn.put_resp_content_type(conn, "application/json")}
    end
  end
end
