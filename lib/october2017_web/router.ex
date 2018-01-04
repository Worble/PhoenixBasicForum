defmodule October2017Web.Router do
  use October2017Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", October2017Web do
    pipe_through :browser # Use the default browser stack

    resources "/", ThreadController, only: [:index, :show, :new, :create] do
      resources "/post", PostController, only: [:new, :create]
    end

        # resources "/threads", ThreadController, only: [:show, :new] do

  end

  # Other scopes may use custom stacks.
  # scope "/api", October2017Web do
  #   pipe_through :api
  # end
end
