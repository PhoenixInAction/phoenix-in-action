defmodule AuctionWeb.ItemChannel do
  use Phoenix.Channel

  def join("item:" <> _item_id, _params, socket) do
    {:ok, socket}
  end

  def handle_in("new_bid", params, socket) do
    broadcast!(socket, "new_bid", params)
    {:noreply, socket}
  end
end
