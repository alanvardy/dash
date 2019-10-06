defmodule DashWeb.PageView do
  use DashWeb, :view
  import Phoenix.LiveView

  @spec capitalize(nil | binary) :: nil | binary
  def capitalize(nil), do: nil
  def capitalize(string), do: String.capitalize(string)

  def nice_age(age) do
    case age do
      result when result < 60 ->
        "< 1 min"

      1 ->
        "1 min"

      result when result < 3600 ->
        "#{div(result, 60)} min"

      result when result < 86_400 ->
        "#{div(result, 3600)} hours"

      result when result < 172_800 ->
        "#{div(result, 86_400)} day"

      result ->
        "#{div(result, 86_400)} days"
    end
  end

  @spec nice_status(map) :: binary | nil
  def nice_status(%{status: nil, state: nil}), do: nil
  def nice_status(%{status: nil, state: state}), do: capitalize(state)
  def nice_status(%{status: status}), do: capitalize(status)
end
