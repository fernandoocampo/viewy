defmodule StoryMapper.Tickers do
  @moduledoc """
  The Tickers context.
  """

  import Ecto.Query, warn: false
  alias StoryMapper.Repo

  alias StoryMapper.Tickers.Ticker

  @doc """
  Returns the list of tickers.

  ## Examples

      iex> list_tickers()
      [%Ticker{}, ...]

  """
  def list_tickers do
    Repo.all(Ticker)
  end

  @doc """
  Gets a single ticker.

  Raises `Ecto.NoResultsError` if the Ticker does not exist.

  ## Examples

      iex> get_ticker!(123)
      %Ticker{}

      iex> get_ticker!(456)
      ** (Ecto.NoResultsError)

  """
  def get_ticker!(id), do: Repo.get!(Ticker, id)

  @doc """
  Creates a ticker.

  ## Examples

      iex> create_ticker(%{field: value})
      {:ok, %Ticker{}}

      iex> create_ticker(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_ticker(attrs \\ %{}) do
    %Ticker{}
    |> Ticker.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a ticker.

  ## Examples

      iex> update_ticker(ticker, %{field: new_value})
      {:ok, %Ticker{}}

      iex> update_ticker(ticker, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_ticker(%Ticker{} = ticker, attrs) do
    ticker
    |> Ticker.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ticker.

  ## Examples

      iex> delete_ticker(ticker)
      {:ok, %Ticker{}}

      iex> delete_ticker(ticker)
      {:error, %Ecto.Changeset{}}

  """
  def delete_ticker(%Ticker{} = ticker) do
    Repo.delete(ticker)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking ticker changes.

  ## Examples

      iex> change_ticker(ticker)
      %Ecto.Changeset{data: %Ticker{}}

  """
  def change_ticker(%Ticker{} = ticker, attrs \\ %{}) do
    Ticker.changeset(ticker, attrs)
  end
end
