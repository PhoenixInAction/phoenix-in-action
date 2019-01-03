defmodule BlogWeb.Router do
  use BlogWeb, :router

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

  scope "/", BlogWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/posts", PostController do
      resources "/comments", CommentController, only: [:create]
    end
  end

  scope "/api", BlogWeb.API do
    pipe_through :api

    resources "/posts", PostController, only: [:index, :show]
  end
end
