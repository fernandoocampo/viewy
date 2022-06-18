defmodule StoryMapper.StoriesTest do
  use StoryMapper.DataCase

  alias StoryMapper.Stories

  describe "stories" do
    alias StoryMapper.Stories.Story

    import StoryMapper.StoriesFixtures

    # @invalid_attrs %{project_id: nil, title: nil}
    @invalid_attrs %{title: nil}

    test "list_stories/0 returns all stories" do
      story = story_fixture()
      assert Stories.list_stories() == [story]
    end

    test "get_story!/1 returns the story with given id" do
      story = story_fixture()
      assert Stories.get_story!(story.id) == story
    end

    test "create_story/1 with valid data creates a story" do
      # valid_attrs = %{project_id: 42, title: "some title"}
      valid_attrs = %{title: "some title"}

      assert {:ok, %Story{} = story} = Stories.create_story(valid_attrs)
      # assert story.project_id == 42
      assert story.title == "some title"
    end

    test "create_story/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Stories.create_story(@invalid_attrs)
    end

    test "update_story/2 with valid data updates the story" do
      story = story_fixture()
      # update_attrs = %{project_id: 43, title: "some updated title"}
      update_attrs = %{title: "some updated title"}

      assert {:ok, %Story{} = story} = Stories.update_story(story, update_attrs)
      # assert story.project_id == 43
      assert story.title == "some updated title"
    end

    test "update_story/2 with invalid data returns error changeset" do
      story = story_fixture()
      assert {:error, %Ecto.Changeset{}} = Stories.update_story(story, @invalid_attrs)
      assert story == Stories.get_story!(story.id)
    end

    test "delete_story/1 deletes the story" do
      story = story_fixture()
      assert {:ok, %Story{}} = Stories.delete_story(story)
      assert_raise Ecto.NoResultsError, fn -> Stories.get_story!(story.id) end
    end

    test "change_story/1 returns a story changeset" do
      story = story_fixture()
      assert %Ecto.Changeset{} = Stories.change_story(story)
    end
  end
end
