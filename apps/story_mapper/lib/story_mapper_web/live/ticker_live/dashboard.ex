defmodule StoryMapperWeb.TickerLive.Dashboard do
  @moduledoc """
  This module defines logic for the ticker live dashboard.
  """
  use StoryMapperWeb, :live_view

  alias StoryMapper.Tickers
  # alias StoryMapper.Tickers.Ticker

  @impl true
  def mount(_params, _session, socket) do
    {year, week} = :calendar.iso_week_number()
    years = Enum.to_list(year..(year - 3))
    weeks = Enum.to_list(1..53)

    {:ok,
     socket
     |> assign(:year, year)
     |> assign(:week, week)
     |> assign(:years, years)
     |> assign(:weeks, weeks)
     |> assign(:tickers, list_tickers())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  @impl true
  def handle_event("filter", %{"filter" => params}, socket) do
    {:noreply,
     socket
     |> assign(:selected_choice, params["year"])
     |> assign(:year, params["year"])
     |> assign(:week, params["week"])
     |> assign(:tickers, list_tickers())}
  end

  defp apply_action(socket, :dashboard, _params) do
    socket
    |> assign(:page_title, "Dashboard Industry")
    |> assign(:ticker, nil)
  end

  defp list_tickers do
    Tickers.list_tickers()
  end
end
