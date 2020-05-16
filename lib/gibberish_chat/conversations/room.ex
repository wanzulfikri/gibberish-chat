defmodule GibberishChat.Conversations.Room do
  use Ecto.Schema
  import Ecto.Changeset

  schema "rooms" do
    field :topic, :string

    timestamps()
  end

  @doc false
  def changeset(room, attrs) do
    room
    |> cast(attrs, [:topic])
    |> validate_required([:topic])
  end
end
