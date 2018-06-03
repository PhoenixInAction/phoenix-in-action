defmodule Blog.Repo.Migrations.CreateBlog.API.Post do
  use Ecto.Migration

  def change do
    create table(:posts) do

      timestamps()
    end

  end
end
