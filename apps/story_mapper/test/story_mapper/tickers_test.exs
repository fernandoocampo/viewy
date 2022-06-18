defmodule StoryMapper.TickersTest do
  use StoryMapper.DataCase

  alias StoryMapper.Tickers

  describe "tickers" do
    alias StoryMapper.Tickers.Ticker

    import StoryMapper.TickersFixtures

    @invalid_attrs %{industry: nil, name: nil, rank: nil}

    test "list_tickers/0 returns all tickers" do
      ticker = ticker_fixture()
      assert Tickers.list_tickers() == [ticker]
    end

    test "get_ticker!/1 returns the ticker with given id" do
      ticker = ticker_fixture()
      assert Tickers.get_ticker!(ticker.id) == ticker
    end

    test "create_ticker/1 with valid data creates a ticker" do
      valid_attrs = %{industry: "some industry", name: "some name", rank: 120.5}

      assert {:ok, %Ticker{} = ticker} = Tickers.create_ticker(valid_attrs)
      assert ticker.industry == "some industry"
      assert ticker.name == "some name"
      assert ticker.rank == 120.5
    end

    test "create_ticker/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tickers.create_ticker(@invalid_attrs)
    end

    test "update_ticker/2 with valid data updates the ticker" do
      ticker = ticker_fixture()
      update_attrs = %{industry: "some updated industry", name: "some updated name", rank: 456.7}

      assert {:ok, %Ticker{} = ticker} = Tickers.update_ticker(ticker, update_attrs)
      assert ticker.industry == "some updated industry"
      assert ticker.name == "some updated name"
      assert ticker.rank == 456.7
    end

    test "update_ticker/2 with invalid data returns error changeset" do
      ticker = ticker_fixture()
      assert {:error, %Ecto.Changeset{}} = Tickers.update_ticker(ticker, @invalid_attrs)
      assert ticker == Tickers.get_ticker!(ticker.id)
    end

    test "delete_ticker/1 deletes the ticker" do
      ticker = ticker_fixture()
      assert {:ok, %Ticker{}} = Tickers.delete_ticker(ticker)
      assert_raise Ecto.NoResultsError, fn -> Tickers.get_ticker!(ticker.id) end
    end

    test "change_ticker/1 returns a ticker changeset" do
      ticker = ticker_fixture()
      assert %Ecto.Changeset{} = Tickers.change_ticker(ticker)
    end
  end
end
