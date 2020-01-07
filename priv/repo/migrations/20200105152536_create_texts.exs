defmodule Jat.Repo.Migrations.CreateTexts do
  use Ecto.Migration

  def change do
    create table(:texts) do
      add :name, :string
      add :body, :text
      add :room, :string

      timestamps()
    end

    create index(:texts, [:room])
  end
end
