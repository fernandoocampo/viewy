defmodule StoryMapper.Projects.Project do
  @moduledoc """
  This module defines a structure for project.
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "projects" do
    field :title, :string

    has_many :stories, StoryMapper.Stories.Story

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
