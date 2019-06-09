defmodule Dash.Factory do
  @moduledoc "Factory for test entries"
  alias Dash.Accounts.{Settings, User}
  alias Dash.Backgrounds.Background
  use ExMachina.Ecto, repo: Dash.Repo

  @spec user_factory() :: Dash.Accounts.User.t()
  def user_factory do
    %User{
      name: "User",
      email: "email@place.com",
      password: "password",
      password_confirmation: "password",
      password_hash: Pbkdf2.hash_pwd_salt("password"),
      settings: build(:settings)
    }
  end

  @spec user2_factory() :: Dash.Accounts.User.t()
  def user2_factory do
    %User{
      name: "User2",
      email: "email2@otherplace.com",
      password: "password",
      password_confirmation: "password",
      password_hash: Pbkdf2.hash_pwd_salt("password")
    }
  end

  def settings_factory do
    %Settings{
      harvest_api_key: "123jkh12k123",
      harvest_account_id: "5678"
    }
  end

  def nil_settings_factory do
    %Settings{
      harvest_api_key: nil,
      harvest_account_id: nil
    }
  end

  def background_factory do
    %Background{
      alt: "seashore",
      date: ~D[2019-06-09],
      description: "STUFF AND THINGS!",
      first_name: "David",
      inserted_at: ~N[2019-06-09 03:11:31],
      last_name: "Emrich",
      link: "https://unsplash.com/photos/5YxcScCwuMg",
      profile_image:
        "https://images.unsplash.com/profile-fb-1520935645-e58a496183d3.jpg?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
      updated_at: ~N[2019-06-09 03:11:31],
      url:
        "https://images.unsplash.com/photo-1535667065976-f466b235cc85?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjc0ODM0fQ"
    }
  end
end
