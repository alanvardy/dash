defmodule Dash.Backgrounds.Query do
  @moduledoc "For interacting with backgrounds table"

  alias Dash.Backgrounds.Store

  def update_background(%{background: background, needs_update: false}), do: background

  def update_background(%{background: background, user_id: user_id, needs_update: true}) do
    Store.update(user_id, background)
    background
  end

  def find_background(%{user_id: nil} = data) do
    data
    |> Map.put(:background, nil)
    |> Map.put(:needs_update, false)
  end

  def find_background(%{user_id: user_id} = data) do
    # today = Timex.today()
    background = Store.value(user_id)
    needs_update = background == nil

    data
    |> Map.put(:background, background)
    |> Map.put(:needs_update, needs_update)
  end
end
