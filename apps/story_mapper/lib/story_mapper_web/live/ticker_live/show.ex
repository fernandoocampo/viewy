defmodule StoryMapperWeb.TickerLive.Show do
  use StoryMapperWeb, :live_view

  alias StoryMapper.Tickers

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:ticker, Tickers.get_ticker!(id))}
  end

  defp page_title(:show), do: "Show Ticker"
  defp page_title(:edit), do: "Edit Ticker"
end
