defmodule Rumbl.UserTest do
  use Rumbl.ModelCase, async: true
  alias Rumbl.User

  @valid_attrs %{name: "A User", username: "eva", password: "secret"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "changeset does not accept long username" do
    attrs = Map.put(@valid_attrs, :username, String.duplicate("a", 30))
    assert errors_on(%User{}, attrs)[:username] == "should be at most 20 character(s)"
  end
end
