defmodule ApiclosetWeb.Router do
  use ApiclosetWeb, :router

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

  scope "/", ApiclosetWeb do
    pipe_through :browser # Use the default browser stack
    resources "/users", UserController, except: [:new, :edit]
    resources "/posts", PostController, except: [:new, :edit]
    get "/", PageController, :index
  end

  forward "/api", Absinthe.Plug,
    schema: ApiclosetWeb.Schema

  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: ApiclosetWeb.Schema

end
