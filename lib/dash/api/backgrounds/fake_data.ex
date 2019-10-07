defmodule Dash.Api.Backgrounds.FakeData do
  @moduledoc """
  Fake API data for development testing and CI
  """
  def time do
    Timex.format!(Timex.to_datetime(Timex.now(), "America/Chicago"), "{ISO:Extended:Z}")
  end

  def today do
    {:ok, date} = Timex.format(Timex.today(), "%Y-%m-%d", :strftime)
    date
  end

  def generate(url) do
    case url do
      "/photos/random" ->
        %{
          "alt_description" => "brown and black rocks",
          "categories" => [],
          "color" => "#10100F",
          "created_at" => "2019-03-08T14:43:53-05:00",
          "current_user_collections" => [],
          "description" => nil,
          "downloads" => 938,
          "exif" => %{
            "aperture" => "7.1",
            "exposure_time" => "1/1000",
            "focal_length" => "16.0",
            "iso" => 800,
            "make" => "SONY",
            "model" => "ILCE-7"
          },
          "height" => 4000,
          "id" => "5cp2QJV8lIo",
          "liked_by_user" => false,
          "likes" => 29,
          "links" => %{
            "download" => "https://unsplash.com/photos/5cp2QJV8lIo/download",
            "download_location" => "https://api.unsplash.com/photos/5cp2QJV8lIo/download",
            "html" => "https://unsplash.com/photos/5cp2QJV8lIo",
            "self" => "https://api.unsplash.com/photos/5cp2QJV8lIo"
          },
          "sponsored" => false,
          "sponsored_by" => nil,
          "sponsored_impressions_id" => nil,
          "updated_at" => "2019-05-17T19:50:46-04:00",
          "urls" => %{
            "full" =>
              "https://images.unsplash.com/photo-1552074213-7c924a99caae?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjc0ODM0fQ",
            "raw" =>
              "https://images.unsplash.com/photo-1552074213-7c924a99caae?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjc0ODM0fQ",
            "regular" =>
              "https://images.unsplash.com/photo-1552074213-7c924a99caae?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjc0ODM0fQ",
            "small" =>
              "https://images.unsplash.com/photo-1552074213-7c924a99caae?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjc0ODM0fQ",
            "thumb" =>
              "https://images.unsplash.com/photo-1552074213-7c924a99caae?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjc0ODM0fQ"
          },
          "user" => %{
            "accepted_tos" => true,
            "bio" =>
              "UX/UI designer, photographer when not in office, SLOWLY learning to be an Android Dev. ",
            "first_name" => "Joseph",
            "id" => "ev5iv5untbc",
            "instagram_username" => "jbcreate",
            "last_name" => "Barrientos",
            "links" => %{
              "followers" => "https://api.unsplash.com/users/jbcreate_/followers",
              "following" => "https://api.unsplash.com/users/jbcreate_/following",
              "html" => "https://unsplash.com/@jbcreate_",
              "likes" => "https://api.unsplash.com/users/jbcreate_/likes",
              "photos" => "https://api.unsplash.com/users/jbcreate_/photos",
              "portfolio" => "https://api.unsplash.com/users/jbcreate_/portfolio",
              "self" => "https://api.unsplash.com/users/jbcreate_"
            },
            "location" => "bay area, ca",
            "name" => "Joseph Barrientos",
            "portfolio_url" => "http://jbcreate.dribbble.com",
            "profile_image" => %{
              "large" =>
                "https://images.unsplash.com/profile-1519253190440-f7f9529d104a?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128",
              "medium" =>
                "https://images.unsplash.com/profile-1519253190440-f7f9529d104a?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64",
              "small" =>
                "https://images.unsplash.com/profile-1519253190440-f7f9529d104a?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32"
            },
            "total_collections" => 0,
            "total_likes" => 1,
            "total_photos" => 57,
            "twitter_username" => "jbcreate_",
            "updated_at" => "2019-05-27T14:25:43-04:00",
            "username" => "jbcreate_"
          },
          "views" => 93_093,
          "width" => 6000
        }
    end
  end
end
