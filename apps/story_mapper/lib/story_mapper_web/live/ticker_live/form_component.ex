defmodule StoryMapperWeb.TickerLive.FormComponent do
  use StoryMapperWeb, :live_component

  alias StoryMapper.Tickers

  @impl true
  def update(%{ticker: ticker} = assigns, socket) do
    changeset = Tickers.change_ticker(ticker)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"ticker" => ticker_params}, socket) do
    changeset =
      socket.assigns.ticker
      |> Tickers.change_ticker(ticker_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"ticker" => ticker_params}, socket) do
    save_ticker(socket, socket.assigns.action, ticker_params)
  end

  defp save_ticker(socket, :edit, ticker_params) do
    case Tickers.update_ticker(socket.assigns.ticker, ticker_params) do
      {:ok, _ticker} ->
        {:noreply,
         socket
         |> put_flash(:info, "Ticker updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_ticker(socket, :new, ticker_params) do
    case Tickers.create_ticker(ticker_params) do
      {:ok, _ticker} ->
        {:noreply,
         socket
         |> put_flash(:info, "Ticker created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
