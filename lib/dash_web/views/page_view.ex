defmodule DashWeb.PageView do
  use DashWeb, :view

  @spec capitalize(nil | binary) :: nil | binary
  def capitalize(nil), do: nil
  def capitalize(string), do: String.capitalize(string)
end
