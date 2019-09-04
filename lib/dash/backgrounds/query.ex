defmodule Dash.Backgrounds.Query do
  @moduledoc "For interacting with backgrounds table"

  alias Dash.Backgrounds.{Background, Store}

  @spec update_background(Dash.Backgrounds.Background.t()) :: map()
  def update_background(%Background{background: background, needs_update: false}), do: background

  def update_background(%Background{background: background, user_id: user_id, needs_update: true}) do
    Store.update(user_id, background)
    background
  end

  @spec find_background(Dash.Backgrounds.Background.t()) :: Dash.Backgrounds.Background.t()
  def find_background(%Background{user_id: nil} = data) do
    %Background{data | background: nil, needs_update: false}
  end

  def find_background(%Background{user_id: user_id} = data) do
    background = Store.value(user_id)

    needs_update =
      cond do
        background == nil -> true
        background.date == Timex.today() -> false
        true -> true
      end

    %Background{data | background: background, needs_update: needs_update}
  end
end
