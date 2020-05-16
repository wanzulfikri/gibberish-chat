defmodule GibberishChatWeb.RoomController do
  use GibberishChatWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html", room: "123")
  end
end
