defmodule RealDealApiWeb.Auth.SetAccount do
  import Plug.Conn
  alias RealDealApiWeb.Auth.ErrorResponse
  alias RealDealApi.Accounts

  def init(_options) do

  end

  def call(conn, _options) do
    account_id = get_session(conn, :account_id)

    if account_id == nil, do: raise ErrorResponse.Unauthorized

    account = Accounts.get_account!(account_id)
    cond do
      account ->
        assign(conn, :account, account)
      true ->
        assign(conn, :account, nil)
    end
  end
end
