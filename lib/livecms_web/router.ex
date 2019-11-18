defmodule LivecmsWeb.Router do
  use LivecmsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Phoenix.LiveView.Flash
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LivecmsWeb do
    pipe_through :browser

    get "/", PageController, :index
  
  end

  scope "/v1" do
    pipe_through :api 

    forward "/api", Absinthe.Plug,
      schema: LivecmsWeb.Schema.Query.Schema

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: LivecmsWeb.Schema.Query.Schema,
      interface: :simple
  end

  # Other scopes may use custom stacks.
  # scope "/api", LivecmsWeb do
  #   pipe_through :api
  # end
end
