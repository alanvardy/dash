defmodule Dash.Accounts do
  use Boundary, deps: [Dash.Repo], exports: []

  @moduledoc """
  The Accounts context.
  """

  alias Dash.Accounts.Settings
  alias Dash.Accounts.User
  alias Dash.Repo
  alias Ecto.Multi
  import Ecto.Query, warn: false

  def get_current_user(%Plug.Conn{assigns: %{current_user: current_user}}), do: current_user
  def get_current_user(_), do: nil

  @spec get_user_by_email(String.t()) :: %User{} | nil
  def get_user_by_email(email) do
    User
    |> where([u], u.email == ^email)
    |> Repo.one()
  end

  @spec get_settings_by_user(%User{}) :: %Settings{}
  def get_settings_by_user(%User{id: id}) do
    Settings
    |> where([u], u.user_id == ^id)
    |> Repo.one()
  end

  @spec authenticate_by_email_and_pass(binary, any) ::
          {:error, :not_found | :unauthorized} | {:ok, Dash.Accounts.User.t()}
  def authenticate_by_email_and_pass(email, given_pass) do
    user = get_user_by_email(email)

    cond do
      Application.get_env(:dash, :env) == :dev ->
        {:ok, user}

      user && Pbkdf2.verify_pass(given_pass, user.password_hash) ->
        {:ok, user}

      user ->
        {:error, :unauthorized}

      true ->
        Pbkdf2.no_user_verify()
        {:error, :not_found}
    end
  end

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id) do
    User
    |> preload(:settings)
    |> Repo.get!(id)
  end

  @spec get_user(pos_integer) :: User.t() | Ecto.NoResultsError
  def get_user(id) do
    User
    |> preload(:settings)
    |> Repo.get(id)
  end

  @doc "get settings for user with settings id"
  @spec get_settings!(pos_integer) :: Settings.t() | Ecto.NoResultsError
  def get_settings!(id) do
    Settings
    |> preload(:user)
    |> Repo.get!(id)
  end

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs) do
    Multi.new()
    |> Multi.insert(:user, User.changeset(%User{}, attrs))
    |> Multi.insert(:settings, fn %{user: user} ->
      Ecto.build_assoc(user, :settings)
    end)
    |> Repo.transaction()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  def update_settings(%Settings{} = settings, attrs) do
    settings
    |> Settings.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  @spec change_settings(Dash.Accounts.Settings.t()) :: Ecto.Changeset.t()
  def change_settings(%Settings{} = settings) do
    Settings.changeset(settings, %{})
  end
end
