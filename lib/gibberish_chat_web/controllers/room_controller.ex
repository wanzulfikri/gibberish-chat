defmodule GibberishChatWeb.RoomController do
  use GibberishChatWeb, :controller

  alias GibberishChat.Conversations

  def index(conn, _params) do
    rooms = Conversations.list_rooms()
    render(conn, "index.html", rooms: rooms)
  end
end
