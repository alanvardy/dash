defmodule Dash.Abilities do
  @moduledoc "authorization for users"
  alias Dash.Accounts.User

  defimpl Canada.Can, for: User do
    def can?(%User{}, action, %User{})
      when action in [:create], do: true

    def can?(%User{id: user_id}, action, %User{id: user_id})
      when action in [:edit, :update, :read, :destroy, :touch], do: true
  end
end