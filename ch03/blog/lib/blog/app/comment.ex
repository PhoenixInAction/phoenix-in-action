defmodule Blog.App.Comment do
  use Ecto.Schema
  import Ecto.Changeset


  schema "comments" do
    field :body, :string
    field :name, :string
    field :post_id, :id

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:name, :body])
    |> validate_required([:name, :body])
  end
end
