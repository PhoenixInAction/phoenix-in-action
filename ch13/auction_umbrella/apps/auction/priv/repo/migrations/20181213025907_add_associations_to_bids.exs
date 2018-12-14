defmodule Auction.Repo.Migrations.AddAssociationsToBids do
  use Ecto.Migration

  def change do
    alter table(:bids) do
      add :item_id, references(:items)
      add :user_id, references(:users)
    end

    create index(:bids, [:item_id])
    create index(:bids, [:user_id])
    create index(:bids, [:item_id, :user_id])
  end
end
