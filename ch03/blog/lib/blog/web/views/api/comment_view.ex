defmodule Blog.Web.API.CommentView do
  use Blog.Web, :view
  alias Blog.Web.API.CommentView

  def render("comment.json", %{comment: comment}) do
    %{id: comment.id, name: comment.name, body: comment.body}
  end
end
