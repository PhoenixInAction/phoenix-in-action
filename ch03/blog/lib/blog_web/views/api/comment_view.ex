defmodule BlogWeb.API.CommentView do
  use BlogWeb, :view
  alias BlogWeb.API.CommentView

  def render("comment.json", %{comment: comment}) do
    %{id: comment.id, name: comment.name, body: comment.body}
  end
end
