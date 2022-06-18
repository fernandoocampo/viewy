defmodule StoryMapper.Repo.Migrations.CreateTickers do
  use Ecto.Migration

  def change do
    create table(:tickers) do
      add :name, :string
      add :rank, :float
      add :industry, :string

      timestamps()
    end
  end
end
