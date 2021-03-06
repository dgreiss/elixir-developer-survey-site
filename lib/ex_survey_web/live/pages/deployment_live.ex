defmodule ExSurveyWeb.DeploymentLive do
  @moduledoc """
  This page hase the following questions from the survey:
  1. Where do you deploy your Elixir applications to?
  2. How are you deploying your Elixir application?
  3. If your project(s) uses Continuous Integration which is it?
  4. Have you ever used Hot Code Reloading in production?
  """

  use ExSurveyWeb, :live_view

  alias ExSurvey.Survey

  @questions [44, 45, 46, 43]

  @impl true
  def mount(_params, _session, socket) do
    data =
      @questions
      |> Enum.map(&Survey.get_summary_map/1)

    {:ok, assign(socket, data: data)}
  end
end
