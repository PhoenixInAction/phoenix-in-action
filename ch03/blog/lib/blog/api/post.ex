defmodule Blog.API.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias Blog.API.Post


  schema "posts" do
    field :title, :string
    field :body, :string
    has_many :comments, Blog.API.Comment

    timestamps()
  end

  @doc false
  def changeset(%Post{} = post, attrs) do
    post
    |> cast(attrs, [])
    |> validate_required([])
  end
end
