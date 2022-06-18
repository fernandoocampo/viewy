defmodule StoryMapper.StoriesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `StoryMapper.Stories` context.
  """

  @doc """
  Generate a story.
  """
  def story_fixture(attrs \\ %{}) do
    {:ok, story} =
      attrs
      |> Enum.into(%{
        # project_id: 42,
        title: "some title"
      })
      |> StoryMapper.Stories.create_story()

    story
  end
end
