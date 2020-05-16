defmodule GibberishChatWeb.MessageLive.Chat do
  use GibberishChatWeb, :live_view

  alias GibberishChat.Conversations
  alias GibberishChat.Conversations.Message
  @impl true
  @spec mount(any, any, Phoenix.LiveView.Socket.t()) :: {:ok, Phoenix.LiveView.Socket.t()}
  def mount(_params, _session, socket) do
    Phoenix.PubSub.subscribe(GibberishChat.PubSub, "new-message")

    {:ok,
     socket
     |> assign(:messages, Conversations.list_messages())
     |> assign(:changeset, Conversations.change_message(%Message{}))}
  end

  @impl true
  @spec handle_event(<<_::64>>, map, Phoenix.LiveView.Socket.t()) ::
          {:noreply, Phoenix.LiveView.Socket.t()}
  def handle_event("validate", %{"message" => params}, socket) do
    changeset =
      %Message{}
      |> Conversations.change_message(params)
      |> Map.put(:action, :insert)

    IO.inspect(changeset)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("send", %{"message" => params}, socket) do
    case Conversations.create_message(params) do
      {:ok, message} ->
        Phoenix.PubSub.broadcast_from(GibberishChat.PubSub, self(), "new-message", message)

        {:noreply,
         socket
         |> assign(:messages, socket.assigns.messages ++ [message])
         |> put_flash(:info, "Message created successfully")}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

  @impl true
  def handle_info(message, socket) do
    {:noreply,
     socket
     |> assign(:messages, socket.assigns.messages ++ [message])}
  end
end
