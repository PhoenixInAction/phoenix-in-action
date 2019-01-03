defmodule AuctionTest do
  use ExUnit.Case
  doctest Auction

  test "greets the world" do
    assert Auction.hello() == :world
  end
end
