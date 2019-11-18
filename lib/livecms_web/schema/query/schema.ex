defmodule LivecmsWeb.Schema.Query.Schema do
    use Absinthe.Schema

    query do
        @desc "Get a list of Authors"
        field :authors, list_of(:author) do
            resolve &LivecmsWeb.Resolvers.User.authors/3
        end

        @desc "Get  a author by its id"
        field :author, :author do
            arg :id, non_null(:id)
            resolve &LivecmsWeb.Resolvers.User.author/3
        end

        @desc "Get a list of Posts"
        field :posts, list_of(:post) do
            resolve &LivecmsWeb.Resolvers.User.posts/3
        end

        @desc "Get  a Post by its id"
        field :post, :post do
            arg :id, non_null(:id)
            resolve &LivecmsWeb.Resolvers.User.post/3
        end

    end

    object :author do
        field :id, non_null(:id)
        field :name, non_null(:string)
        field :bio, non_null(:string)
    end

    object :post do
        field :id, non_null(:id)
        field :title, non_null(:string)
        field :body, non_null(:string)
    end
end