defmodule Blog.API.Comment do
  use Ecto.Schema
  import Ecto.Changeset
  alias Blog.API.Comment


  schema "comments" do
    field :name, :string
    field :body, :string
    belongs_to :post, Blog.API.Post

    timestamps()
  end

  @doc false
  def changeset(%Comment{} = comment, attrs) do
    comment
    |> cast(attrs, [])
    |> validate_required([])
  end
end
