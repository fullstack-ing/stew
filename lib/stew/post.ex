defmodule Stew.Post do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {JSON.Encoder, only: [:title, :slug, :body, :description, :published_at, :draft, :free]}
  schema "posts" do
    field(:title, :string)
    field(:slug, :string)
    field(:body, :string)
    field(:description, :string)
    field(:published_at, :date)
    field(:draft, :boolean, default: false)
    field(:free, :boolean, default: false)
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :slug, :body, :description, :published_at, :draft, :free])
    |> validate_required([:title, :slug, :body, :description, :published_at, :draft, :free])
  end
end
