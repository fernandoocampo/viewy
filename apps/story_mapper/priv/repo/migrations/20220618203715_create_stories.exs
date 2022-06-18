defmodule StoryMapper.Repo.Migrations.CreateStories do
  use Ecto.Migration

  def change do
    create table(:stories) do
      add :title, :string
      add :project_id, references(:projects, on_delete: :delete_all)

      timestamps()
    end
  end
end
