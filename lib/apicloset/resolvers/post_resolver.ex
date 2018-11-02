defmodule Apicloset.PostResolver do
  alias Apicloset.Posts

  def all(_args, _info) do
    {:ok, Posts.list_posts()}
  end

  def create(args, _info) do
    Posts.create_post(args)
  end

  def find(%{id: id}, _info) do
    case Posts.get_post!(id) do
      nil -> {:error, "Post id #{id} not found"}
      post -> {:ok, post}
    end
  end
end
