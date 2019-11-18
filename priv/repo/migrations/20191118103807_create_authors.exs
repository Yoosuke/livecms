defmodule Livecms.Repo.Migrations.CreateAuthors do
  use Ecto.Migration

  def change do
    create table(:authors) do
      add :name, :string
      add :bio, :string

      timestamps()
    end

  end
end
