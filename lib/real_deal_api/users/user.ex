defmodule RealDealApi.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :biography, :string
    field :full_name, :string
    field :gender, :string
    belongs_to :account, RealDealApi.Accounts.Account

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:account_id, :full_name, :gender, :biography])
    |> validate_required([:account_id])
  end
end
