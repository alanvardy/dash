defmodule Dash.Abilities do
  @moduledoc "User authorization"
  alias Dash.Accounts.User

  defimpl Canada.Can, for: User do
    def can?(%User{}, action, %User{})
      when action in [:create], do: true

    def can?(%User{id: user_id}, action, %User{id: user_id})
      when action in [:edit, :update, :read, :destroy, :touch], do: true

    def can?(%User{}, action, %User{})
      when action in [:edit, :update, :read, :destroy, :touch], do: false

    def can?(subject, action, resource) do
      raise """
      Unimplemented authorization check for User!  To fix see below...

      Please implement `can?` for User in #{__ENV__.file}.

      The function should match:

      subject:  #{inspect subject}

      action:   #{action}

      resource: #{inspect resource}
      """
    end
  end
end
