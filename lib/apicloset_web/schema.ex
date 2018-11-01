defmodule ApiclosetWeb.Schema do
  use Absinthe.Schema
  import_types ApiclosetWeb.Schema.Types

  query do
    field :posts, list_of(:post) do
      resolve &Apicloset.PostResolver.all/2
    end

    field :users, list_of(:user) do
      resolve &Apicloset.UserResolver.all/2
    end

    field :user, type: :user do
      arg :id, non_null(:id)
      resolve &Apicloset.UserResolver.find/2
    end
  end
end
