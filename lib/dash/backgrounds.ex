defmodule Dash.Backgrounds do
  @moduledoc "Nice pretty backgrounds for users"

  alias Dash.Backgrounds.{Query, Unsplash}

  def get_for(nil), do: nil

  def get_for(user) do
    %{}
    |> Map.put(:user_id, user.id)
    # Check for current background
    |> Query.find()
    # Get from API if not found
    |> Unsplash.get_random()
    # Make the response useful
    |> Unsplash.filter()
    # Create if not pulled from DB
    |> Query.create()
  end
end
