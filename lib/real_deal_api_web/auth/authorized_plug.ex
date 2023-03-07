defmodule RealDealApiWeb.Auth.AuthorizedPlug do

alias RealDealApiWeb.Auth.ErrorResponse

  def is_authorized(%{params: %{"account" => params}} = conn, _opt) do
    IO.inspect(conn.assigns.account.id)
    IO.inspect(params["id"])
    if conn.assigns.account.id == params["id"] do
      conn
    else
      raise ErrorResponse.Forbidden
    end
  end

  def is_authorized(%{params: %{"user" => params}} = conn, _opt) do
    if conn.assigns.account.user.id == params["id"] do
      conn
    else
      raise ErrorResponse.Forbidden
    end
  end
end
