defmodule StoryMapperWeb.TickerLive.Index do
  use StoryMapperWeb, :live_view

  alias StoryMapper.Tickers
  alias StoryMapper.Tickers.Ticker

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :tickers, list_tickers())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Ticker")
    |> assign(:ticker, Tickers.get_ticker!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Ticker")
    |> assign(:ticker, %Ticker{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Tickers")
    |> assign(:ticker, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    ticker = Tickers.get_ticker!(id)
    {:ok, _} = Tickers.delete_ticker(ticker)

    {:noreply, assign(socket, :tickers, list_tickers())}
  end

  defp list_tickers do
    Tickers.list_tickers()
  end
end
