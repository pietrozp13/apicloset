defmodule Apicloset.UserResolver do
  alias Apicloset.Accounts

  def all(_args, _info) do
    {:ok, Accounts.list_users()}
  end

  def create(args, _info) do
    Accounts.create_user(args)
  end

  def find(%{id: id}, _info) do
    case Accounts.get_user!(id) do
      nil -> {:error, "User id #{id} not found"}
      user -> {:ok, user}
    end
  end
end
