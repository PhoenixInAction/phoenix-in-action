defmodule Blog.Web.PostControllerTest do
  use Blog.Web.ConnCase

  alias Blog.App

  @create_attrs %{body: "some body", title: "some title"}
  @update_attrs %{body: "some updated body", title: "some updated title"}
  @invalid_attrs %{body: nil, title: nil}

  def fixture(:post) do
    {:ok, post} = App.create_post(@create_attrs)
    post
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, post_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing Posts"
  end

  test "renders form for new posts", %{conn: conn} do
    conn = get conn, post_path(conn, :new)
    assert html_response(conn, 200) =~ "New Post"
  end

  test "creates post and redirects to show when data is valid", %{conn: conn} do
    conn = post conn, post_path(conn, :create), post: @create_attrs

    assert %{id: id} = redirected_params(conn)
    assert redirected_to(conn) == post_path(conn, :show, id)

    conn = get conn, post_path(conn, :show, id)
    assert html_response(conn, 200) =~ "Show Post"
  end

  test "does not create post and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, post_path(conn, :create), post: @invalid_attrs
    assert html_response(conn, 200) =~ "New Post"
  end

  test "renders form for editing chosen post", %{conn: conn} do
    post = fixture(:post)
    conn = get conn, post_path(conn, :edit, post)
    assert html_response(conn, 200) =~ "Edit Post"
  end

  test "updates chosen post and redirects when data is valid", %{conn: conn} do
    post = fixture(:post)
    conn = put conn, post_path(conn, :update, post), post: @update_attrs
    assert redirected_to(conn) == post_path(conn, :show, post)

    conn = get conn, post_path(conn, :show, post)
    assert html_response(conn, 200) =~ "some updated body"
  end

  test "does not update chosen post and renders errors when data is invalid", %{conn: conn} do
    post = fixture(:post)
    conn = put conn, post_path(conn, :update, post), post: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit Post"
  end

  test "deletes chosen post", %{conn: conn} do
    post = fixture(:post)
    conn = delete conn, post_path(conn, :delete, post)
    assert redirected_to(conn) == post_path(conn, :index)
    assert_error_sent 404, fn ->
      get conn, post_path(conn, :show, post)
    end
  end
end
