defmodule Dash.Backgrounds do
  @moduledoc "Nice pretty backgrounds for users"

  alias Dash.Backgrounds.{Query, Unsplash}

  def get_for(nil), do: nil

  def get_for(user) do
    user
    |> add_user_id()
    |> Query.find_background()
    |> Unsplash.get_random_picture()
    |> Unsplash.filter_picture_attrs()
    |> Query.create_background()
  end

  defp add_user_id(user) do
    %{user_id: user.id}
  end
end
