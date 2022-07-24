defmodule StoryMapper.Stories.Story do
  @moduledoc """
  This module defines a structure for the stories.
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "stories" do
    field :title, :string

    belongs_to :project, StoryMapper.Projects.Project

    timestamps()
  end

  @doc false
  def changeset(story, attrs) do
    story
    |> cast(attrs, [:title, :project_id])
    |> validate_required([:title])
  end
end
