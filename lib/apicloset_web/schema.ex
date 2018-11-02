defmodule ApiclosetWeb.Schema do
  use Absinthe.Schema
  import_types ApiclosetWeb.Schema.Types

  query do
    field :posts, list_of(:post) do
      resolve &Apicloset.PostResolver.all/2
    end

    field :post, type: :post do
      arg :id, non_null(:id)
      resolve &Apicloset.PostResolver.find/2
    end

    field :users, list_of(:user) do
      resolve &Apicloset.UserResolver.all/2
    end

    field :user, type: :user do
      arg :id, non_null(:id)
      resolve &Apicloset.UserResolver.find/2
    end
  end

  mutation do
    field :create_post, type: :post do
      arg :title, non_null(:string)
      arg :body, non_null(:string)
      arg :user_id, non_null(:integer)

      resolve &Apicloset.PostResolver.create/2
    end
  end
end
