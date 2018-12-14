defmodule AuctionWeb.Api.UserView do
  use AuctionWeb, :view

  def render("user.json", %{user: user}) do
    %{
      type: "user",
      id: user.id,
      username: user.username
    }
  end
end
