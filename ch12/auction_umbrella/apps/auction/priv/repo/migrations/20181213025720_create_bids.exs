defmodule Auction.Repo.Migrations.CreateBids do
  use Ecto.Migration

  def change do
    create table(:bids) do
      add :amount, :integer
      timestamps()
    end
  end
end
