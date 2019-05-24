defmodule DashWeb.Router do
  use DashWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug DashWeb.Auth
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DashWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/users", UserController
    resources "/sessions", SessionController, only: [:new, :create, :delete]
    resources "/settings", SettingsController, only: [:show, :edit, :update]
  end

  # Other scopes may use custom stacks.
  # scope "/api", DashWeb do
  #   pipe_through :api
  # end
end
