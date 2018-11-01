defmodule Apicloset.PostResolver do
  alias Apicloset.Posts

  def all(_args, _info) do
    {:ok, Posts.list_posts()}
  end
end
