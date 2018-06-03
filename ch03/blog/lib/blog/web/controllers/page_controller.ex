defmodule Blog.Web.PageController do
  use Blog.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
