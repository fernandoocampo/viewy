defmodule StoryMapperWeb.ProjectLive.Show do
  @moduledoc """
  This module defines logic for the project live show.
  """
  use StoryMapperWeb, :live_view

  alias StoryMapper.Projects

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    project = Projects.get_project!(id) |> StoryMapper.Repo.preload(:stories)

    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:project, project)
     |> assign(:stories, project.stories)}

    #  |> assign(:project, Projects.get_project!(id))}
  end

  defp page_title(:show), do: "Show Project"
  defp page_title(:edit), do: "Edit Project"
end
