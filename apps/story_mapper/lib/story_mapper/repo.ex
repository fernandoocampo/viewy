defmodule StoryMapper.Repo do
  @moduledoc """
  This module defines repository to persist stories.
  """
  use Ecto.Repo,
    otp_app: :story_mapper,
    adapter: Ecto.Adapters.Postgres
end
