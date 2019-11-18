defmodule Livecms.User.Author do
  use Ecto.Schema
  import Ecto.Changeset

  schema "authors" do
    field :bio, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(author, attrs) do
    author
    |> cast(attrs, [:name, :bio])
    |> validate_required([:name, :bio])
  end
end
