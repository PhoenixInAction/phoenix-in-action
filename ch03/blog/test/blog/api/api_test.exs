defmodule Blog.APITest do
  use Blog.DataCase

  alias Blog.API

  describe "posts" do
    alias Blog.API.Post

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def post_fixture(attrs \\ %{}) do
      {:ok, post} =
        attrs
        |> Enum.into(@valid_attrs)
        |> API.create_post()

      post
    end

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert API.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert API.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      assert {:ok, %Post{} = post} = API.create_post(@valid_attrs)
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = API.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      assert {:ok, post} = API.update_post(post, @update_attrs)
      assert %Post{} = post
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = API.update_post(post, @invalid_attrs)
      assert post == API.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = API.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> API.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = API.change_post(post)
    end
  end
end
