defmodule Dash.Api.Backgrounds.Unsplash do
  @moduledoc "Pulls background data from Unsplash API"

  alias Dash.Api.Backgrounds.{Background, FakeData}

  @options [
    ssl: [{:versions, [:"tlsv1.2"]}],
    recv_timeout: 2000,
    params: %{orientation: "landscape"}
  ]

  @spec filter_picture_attrs(%Background{}) :: %Background{}
  def filter_picture_attrs(%Background{background: nil, response: response} = data) do
    background = %{
      link: get_in(response, ["links", "html"]),
      url: get_in(response, ["urls", "full"]),
      alt: Map.get(response, "alt_description"),
      description: Map.get(response, "description"),
      first_name: get_in(response, ["user", "first_name"]),
      last_name: get_in(response, ["user", "last_name"]),
      profile_image: get_in(response, ["user", "profile_image", "small"]),
      date: Timex.today()
    }

    %Background{data | background: background}
  end

  def filter_picture_attrs(data), do: data

  # Pull in all projects as a map
  @spec get_random_picture(%Background{}) :: %Background{}
  def get_random_picture(%Background{background: nil} = data) do
    response = get("/photos/random")
    %Background{data | response: response}
  end

  def get_random_picture(data), do: data

  # make a get request to the Unsplash API
  @spec get(String.t()) :: map()
  def get(address) do
    case Application.get_env(:dash, :env) do
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
