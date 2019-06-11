defmodule Dash.Backgrounds.Unsplash do
  @moduledoc "Pulls background data from Unsplash API"

  alias Dash.FakeData

  @options [
    ssl: [{:versions, [:"tlsv1.2"]}],
    recv_timeout: 2000,
    params: %{orientation: "landscape"}
  ]

  def filter_picture_attrs(%{background: nil, response: response} = data) do
    background = %{
      link:
        response
        |> Map.get("links")
        |> Map.get("html"),
      url:
        response
        |> Map.get("urls")
        |> Map.get("full"),
      alt: Map.get(response, "alt_description"),
      description: Map.get(response, "description"),
      first_name:
        response
        |> Map.get("user")
        |> Map.get("first_name"),
      last_name:
        response
        |> Map.get("user")
        |> Map.get("last_name"),
      profile_image:
        response
        |> Map.get("user")
        |> Map.get("profile_image")
        |> Map.get("small"),
      date: Timex.today()
    }

    Map.put(data, :background, background)
  end

  def filter_picture_attrs(data), do: data

  # Pull in all projects as a map

  def get_random_picture(%{background: nil} = data) do
    response = get("/photos/random")
    Map.put(data, :response, response)
  end

  def get_random_picture(data), do: data

  # make a get request to the Unsplash API
  def get(address) do
    case Mix.env() do
      :test ->
        FakeData.generate(address)

      # coveralls-ignore-start
      _ ->
        headers = [Authorization: "Client-ID #{Application.get_env(:dash, :unsplash_api_key)}"]

        "https://api.unsplash.com#{address}"
        |> HTTPoison.get!(headers, @options)
        |> Map.get(:body)
        |> Poison.decode!()
    end

    # coveralls-ignore-stop
  end
end
