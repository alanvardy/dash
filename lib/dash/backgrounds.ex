defmodule Dash.Backgrounds do
  alias Dash.Backgrounds.Query

  def get_for(nil), do: nil

  def get_for(user) do
    user
    |> Query.find_for()
    |> Query.create_for(user)
  end
end
