defmodule RealDealApi.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add :email, :string
      add :hash_password, :string

      timestamps()
    end

    create unique_index(:accounts, [:email])

  end
end
