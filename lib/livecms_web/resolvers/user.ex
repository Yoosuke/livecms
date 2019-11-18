defmodule LivecmsWeb.Resolvers.User do
    alias Livecms.User

    def authors(_, _, _) do
        {:ok, User.list_authors()}
    end

    def author(_, %{id: id}, _) do
        {:ok, User.get_author!(id)}
    end

    def posts(_, _, _) do
        {:ok, User.list_posts()}
    end

    def post(_, %{id: id}, _) do
        {:ok, User.get_post!(id)}
    end
end