defmodule Dash.Backgrounds.Unsplash do
  @moduledoc "For interacting with the Harvest API"
  alias Dash.FakeData

  @options [
    ssl: [{:versions, [:"tlsv1.2"]}],
    recv_timeout: 2000,
    params: %{orientation: "landscape"}
  ]

  def random_picture_filtered do
    pic = random_picture()

    %{
      link:
        pic
        |> Map.get("links")
        |> Map.get("html"),
      url:
        pic
        |> Map.get("urls")
        |> Map.get("full"),
      alt: Map.get(pic, "alt_description"),
      description: Map.get(pic, "description"),
      first_name:
        pic
        |> Map.get("user")
        |> Map.get("first_name"),
      last_name:
        pic
        |> Map.get("user")
        |> Map.get("last_name"),
      profile_image:
        pic
        |> Map.get("user")
        |> Map.get("profile_image")
        |> Map.get("small"),
      date: Timex.today()
    }
  end

  # Pull in all projects as a map
  def random_picture do
    get("/photos/random")
  end

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
  end

  # coveralls-ignore-stop
end
