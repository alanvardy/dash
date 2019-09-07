defmodule DashWeb.PageView do
  use DashWeb, :view

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

      result ->
        "#{div(result, 86_400)} days"
    end
  end
end
