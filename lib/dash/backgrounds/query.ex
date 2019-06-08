defmodule Dash.Backgrounds.Query do
  alias Dash.Backgrounds.{Background, Unsplash}
  alias Dash.Repo
  import Ecto.Query, warn: false

  def create_for([head | _], _user), do: head

  def create_for(_, user) do
    attrs =
      Unsplash.random_picture_filtered()
      |> Map.put(:user_id, user.id)

    background =
      %Background{}
      |> Background.changeset(attrs)
      |> Repo.insert()

    # Retry if bad result
    case background do
      {:ok, bg} -> bg
      {:error, _} -> create_for(:error, user)
    end
  end

  def find_for(user) do
    today = Timex.today()

    Background
    |> where([b], b.date == ^today)
    |> where([b], b.user_id == ^user.id)
    |> order_by([b], :inserted_at)
    |> Repo.all()
  end
end
