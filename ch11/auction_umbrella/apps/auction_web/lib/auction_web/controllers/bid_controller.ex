defmodule AuctionWeb.BidController do
  use AuctionWeb, :controller
  plug :require_logged_in_user

  def create(conn, %{"bid" => %{"amount" => amount}, "item_id" => item_id}) do
    user_id = conn.assigns.current_user.id
    case Auction.insert_bid(%{amount: amount, item_id: item_id, user_id: user_id}) do
      {:ok, bid} -> redirect(conn, to: Routes.item_path(conn, :show, bid.item_id))
      {:error, bid} ->
        item = Auction.get_item(item_id)
        render(conn, AuctionWeb.ItemView, "show.html", item: item, bid: bid)
    end
  end

  defp require_logged_in_user(%{assigns: %{current_user: nil}} = conn, _opts) do
    conn
    |> put_flash(:error, "Nice try, friend. You must be logged in to bid.")
    |> redirect(to: Routes.item_path(conn, :index))
    |> halt()
  end
  defp require_logged_in_user(conn, _opts), do: conn
end
