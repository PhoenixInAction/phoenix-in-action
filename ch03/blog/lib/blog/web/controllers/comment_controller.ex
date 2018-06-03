defmodule Blog.Web.CommentController do
  use Blog.Web, :controller

  alias Blog.App.{Post, Comment}

  def create(conn, %{"post_id" => post_id, "comment" => comment_params}) do
    case Blog.App.create_comment_for_post(comment_params, post_id) do
      {:ok, comment} ->
        conn
        |> put_flash(:info, "Thanks for submitting your comment.")
        |> redirect(to: post_path(conn, :show, comment.post_id))
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_flash(:warning, "Your comment was not submitted successfully")
        |> redirect(to: post_path(conn, :show, post_id))
    end
  end
end
