defmodule Dash.Backgrounds.Query do
  @moduledoc "For interacting with backgrounds table"

  alias Dash.Backgrounds.Background
  alias Dash.Repo
  import Ecto.Query, warn: false

  def create(%{background: %Background{}} = data), do: data.background

  def create(%{background: background, user_id: user_id} = data) do
    attrs = Map.put(background, :user_id, user_id)

    background =
      %Background{}
      |> Background.changeset(attrs)
      |> Repo.insert()

    # Retry if bad result
    case background do
      {:ok, bg} -> bg
      {:error, _} -> create(data)
    end
  end

  def find(%{user_id: user_id} = data) do
    today = Timex.today()

    result =
      Background
      |> where([b], b.date == ^today)
      |> where([b], b.user_id == ^user_id)
      |> order_by([b], :inserted_at)
      |> Repo.all()

    case result do
      [head | _] -> Map.put(data, :background, head)
      _ -> data
    end
  end
end
