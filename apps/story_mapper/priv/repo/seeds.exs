# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     StoryMapper.Repo.insert!(%StoryMapper.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
StoryMapper.Repo.insert_all(
  "projects",
  [
    [title: "project 1", inserted_at: DateTime.utc_now(), updated_at: DateTime.utc_now()],
    [title: "project 2", inserted_at: DateTime.utc_now(), updated_at: DateTime.utc_now()],
    [title: "project 3", inserted_at: DateTime.utc_now(), updated_at: DateTime.utc_now()],
    [title: "project 4", inserted_at: DateTime.utc_now(), updated_at: DateTime.utc_now()],
    [title: "project 5", inserted_at: DateTime.utc_now(), updated_at: DateTime.utc_now()],
    [title: "project 6", inserted_at: DateTime.utc_now(), updated_at: DateTime.utc_now()],
    [title: "project 7", inserted_at: DateTime.utc_now(), updated_at: DateTime.utc_now()],
    [title: "project 8", inserted_at: DateTime.utc_now(), updated_at: DateTime.utc_now()]
  ]
)
