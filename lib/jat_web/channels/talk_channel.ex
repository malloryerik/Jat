defmodule JatWeb.TalkChannel do
  use JatWeb, :channel

  alias Jat.Talks

  def join("talk:" <> _room, _payload, socket) do
    # if authorized?(payload) do
      {:ok, socket}
    # else
    #   {:error, %{reason: "unauthorized"}}
    # end
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  # def handle_in("ping", payload, socket) do
  #   {:reply, {:ok, payload}, socket}
  # end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (talk:lobby).
  def handle_in("shout", payload, socket) do
    IO.puts("OK~~~~~~OK~~~~~~~OK~~~~~OK~~~~~OK~~~~OK")
    IO.inspect(socket)
    IO.puts("OUT~~~~~~OUT~~~~~~~OK~~~~~OK~~~~~OK~~~~OK")
    IO.puts "=====PAYLOAD INSPECTION PLEASE ========="
    IO.inspect(payload)
    IO.puts "=====THANKS, NICE PAYLOAD ========="

    "talk:" <> room = socket.topic
    payload = Map.merge(payload, %{"room" => room})
    Talks.create_text(payload)
    broadcast(socket, "shout", payload)
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  # defp authorized?(_payload) do
  #   true
  # end
end
