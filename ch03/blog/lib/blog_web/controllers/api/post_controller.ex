defmodule BlogWeb.API.PostController do
  use BlogWeb, :controller

  alias Blog.API
  alias Blog.API.Post

  def index(conn, _params) do
    posts = API.list_posts()
    render(conn, "index.json", posts: posts)
  end

  def show(conn, %{"id" => id}) do
    post = API.get_post_with_comments!(id)
    render(conn, "show.json", post: post)
  end
end
