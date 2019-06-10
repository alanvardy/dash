defmodule Dash.Abilities do
  @moduledoc "User authorization"
  alias Dash.Accounts.Settings
  alias Dash.Accounts.User

  defimpl Canada.Can, for: User do
    # User accounts

    def can?(%User{}, :index, User), do: false

    def can?(%User{}, :create, %User{}), do: true

    def can?(%User{id: user_id}, action, %User{id: user_id})
        when action in [:edit, :update, :read, :delete, :touch],
        do: true

    def can?(_, _, %User{}), do: false

    # Settings

    def can?(%User{id: user_id}, action, %Settings{user_id: user_id})
        when action in [:edit, :update],
        do: true

    def can?(_, _, %Settings{}), do: false

    def can?(subject, action, resource) do
      raise """
      Unimplemented authorization check for User!  To fix see below...

      Please implement `can?` for User in #{__ENV__.file}.

      The function should match:

      subject:  #{inspect(subject)}

      action:   #{action}

      resource: #{inspect(resource)}
      """
    end
  end
end
