defmodule Stew.Blog do
  @moduledoc """
  The Blog context.
  """

  import Ecto.Query, warn: false
  alias Stew.Repo
  alias Stew.Post

  @doc """
  Returns the list of posts.

  ## Examples

      iex> list_posts(scope)
      [%Post{}, ...]

  """
  def list_posts() do
    Repo.all(from(post in Post))
  end

  def get_post(slug) do
    Repo.get_by(Post, %{slug: slug})
  end
end
