defmodule StoryMapper.Tickers.Ticker do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tickers" do
    field :industry, :string
    field :name, :string
    field :rank, :float

    timestamps()
  end

  @doc false
  def changeset(ticker, attrs) do
    ticker
    |> cast(attrs, [:name, :rank, :industry])
    |> validate_required([:name, :rank, :industry])
  end
end
