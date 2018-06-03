defmodule Blog.Web.API.PostView do
  use Blog.Web, :view
  alias Blog.Web.API.{PostView, CommentView}

  def render("index.json", %{posts: posts}) do
    %{data: render_many(posts, PostView, "post.json")}
  end

  def render("show.json", %{post: post}) do
    %{data: render_one(post, PostView, "post_with_comments.json")}
  end

  def render("post.json", %{post: post}) do
    %{id: post.id, title: post.title, body: post.body}
  end

  def render("post_with_comments.json", %{post: post}) do
    %{
      id: post.id,
      title: post.title,
      body: post.body,
      comments: render_many(post.comments, CommentView, "comment.json")
    }
  end
end
