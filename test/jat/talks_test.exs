defmodule Jat.TalksTest do
  use Jat.DataCase

  alias Jat.Talks

  describe "texts" do
    alias Jat.Talks.Text

    @valid_attrs %{body: "some body", name: "some name", room: "some room"}
    @update_attrs %{body: "some updated body", name: "some updated name", room: "some updated room"}
    @invalid_attrs %{body: nil, name: nil, room: nil}

    def text_fixture(attrs \\ %{}) do
      {:ok, text} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Talks.create_text()

      text
    end

    test "list_texts/0 returns all texts" do
      text = text_fixture()
      assert Talks.list_texts() == [text]
    end

    test "get_text!/1 returns the text with given id" do
      text = text_fixture()
      assert Talks.get_text!(text.id) == text
    end

    test "create_text/1 with valid data creates a text" do
      assert {:ok, %Text{} = text} = Talks.create_text(@valid_attrs)
      assert text.body == "some body"
      assert text.name == "some name"
      assert text.room == "some room"
    end

    test "create_text/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Talks.create_text(@invalid_attrs)
    end

    test "update_text/2 with valid data updates the text" do
      text = text_fixture()
      assert {:ok, %Text{} = text} = Talks.update_text(text, @update_attrs)
      assert text.body == "some updated body"
      assert text.name == "some updated name"
      assert text.room == "some updated room"
    end

    test "update_text/2 with invalid data returns error changeset" do
      text = text_fixture()
      assert {:error, %Ecto.Changeset{}} = Talks.update_text(text, @invalid_attrs)
      assert text == Talks.get_text!(text.id)
    end

    test "delete_text/1 deletes the text" do
      text = text_fixture()
      assert {:ok, %Text{}} = Talks.delete_text(text)
      assert_raise Ecto.NoResultsError, fn -> Talks.get_text!(text.id) end
    end

    test "change_text/1 returns a text changeset" do
      text = text_fixture()
      assert %Ecto.Changeset{} = Talks.change_text(text)
    end
  end
end
