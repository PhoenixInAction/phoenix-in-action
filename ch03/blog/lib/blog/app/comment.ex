defmodule Blog.App.Comment do
  use Ecto.Schema
  import Ecto.Changeset
  alias Blog.App.Comment


  schema "comments" do
    field :body, :string
    field :name, :string
    belongs_to :post, Blog.App.Post

    timestamps()
  end

  @doc false
  def changeset(%Comment{} = comment, attrs) do
    comment
    |> cast(attrs, [:name, :body, :post_id])
    |> validate_required([:name, :body, :post_id])
  end

  @doc false
  def changeset_with_post(%Comment{} = comment, attrs, post) do
    comment
    |> changeset(attrs)
    |> put_assoc(:post, post)
  end
end
