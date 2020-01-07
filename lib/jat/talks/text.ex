defmodule Jat.Talks.Text do
  use Ecto.Schema
  import Ecto.Changeset

  # ElixirCasts suggests that for a production app we might want
  # a table for rooms and associate texts with it.

  schema "texts" do
    field :body, :string
    field :name, :string
    field :room, :string

    timestamps()
  end

  @doc false
  def changeset(text, attrs) do
    text
    |> cast(attrs, [:name, :body, :room])
    |> validate_required([:name, :body, :room])
  end
end
