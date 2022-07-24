defmodule StoryMapperWeb.PageController do
  @moduledoc """
  This module defines the story mapper page controller.
  """
  use StoryMapperWeb, :controller

  @doc """
  Defines index router.

  """
  def index(conn, _params) do
    render(conn, "index.html")
  end
end
