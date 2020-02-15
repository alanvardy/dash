defmodule Dash.Accounts.Policy do
  @moduledoc "User authorization"
  alias Dash.Accounts.{Settings, User}
  @behaviour Bodyguard.Policy

  def authorize(:new, :background, %User{}), do: true
  def authorize(:new, :background, _), do: false

  def authorize(:index, User, %User{}), do: false

  def authorize(action, %User{}, _) when action in [:new, :create], do: true

  def authorize(action, %User{id: user_id}, %User{id: user_id})
      when action in [:edit, :update, :read, :delete, :touch],
      do: true

  def authorize(_, %User{}, _), do: false

  # Settings

  def authorize(action, %Settings{user_id: user_id}, %User{id: user_id})
      when action in [:edit, :update],
      do: true

  def authorize(_, %Settings{}, _), do: false

  # coveralls-ignore-start
  def authorize(action, resource, user) do
    raise """
    Unimplemented authorization check for User!  To fix see below...

    Please implement `authorize` for User in #{__ENV__.file}.

    The function should match:

    action:   #{action}

    resource: #{inspect(resource)}

    user:  #{inspect(user)}
    """
  end

  # coveralls-ignore-stop
end
