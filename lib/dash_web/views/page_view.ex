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

      result when result < 172_800 ->
        "#{div(result, 86_400)} day"

      result ->
        "#{div(result, 86_400)} days"
    end
  end

  def weekdays_left(%{time: %{weekdays_left: weekdays_left}}) do
    weekdays_left
  end

  def weekdays_left(_), do: "Unknown"

  def month(%{time: %{month: month}}) do
    month
  end

  def month(_), do: "current month"

  def maybe_white_text(hex_color) do
    ~r/.{2}/
    |> Regex.scan(hex_color)
    |> List.flatten()
    |> Enum.map(&hex_to_int/1)
    |> Enum.reduce(fn x, acc -> x + acc end)
    |> case do
      num when num < 450 -> "has-text-white"
      _ -> ""
    end
  end

  defp hex_to_int(hex) do
    <<number>> = Base.decode16!(hex, case: :mixed)
    number
  end
end
