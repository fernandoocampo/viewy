defmodule StoryMapperWeb.PageController do
  use StoryMapperWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
