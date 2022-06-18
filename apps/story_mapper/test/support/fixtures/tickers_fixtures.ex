defmodule StoryMapper.TickersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `StoryMapper.Tickers` context.
  """

  @doc """
  Generate a ticker.
  """
  def ticker_fixture(attrs \\ %{}) do
    {:ok, ticker} =
      attrs
      |> Enum.into(%{
        industry: "some industry",
        name: "some name",
        rank: 120.5
      })
      |> StoryMapper.Tickers.create_ticker()

    ticker
  end
end
