defmodule Dash.Backgrounds do
  use Boundary, deps: [], exports: []
  @moduledoc "Nice pretty backgrounds for users"

  alias Dash.Backgrounds.{Background, Query, Unsplash}

  def get(user) do
    %Background{}
    |> add_user_id(user)
    |> Query.find_background()
    |> Unsplash.get_random_picture()
    |> Unsplash.filter_picture_attrs()
    |> Query.update_background()
  end

  def new(user) do
    %Background{}
    |> add_user_id(user)
    |> Map.put(:needs_update, true)
    |> Unsplash.get_random_picture()
    |> Unsplash.filter_picture_attrs()
    |> Query.update_background()
  end

  defp add_user_id(data, nil), do: data
  defp add_user_id(data, user), do: %Background{data | user_id: user.id}
end
