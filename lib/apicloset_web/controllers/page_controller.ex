defmodule ApiclosetWeb.PageController do
  use ApiclosetWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
