defmodule GibberishChatWeb.PageController do
  use GibberishChatWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
