defmodule ExSurveyWeb.LibrariesLive do
  @moduledoc """
  This page hase the following questions from the survey:
  1. If there is one library that you are excited about in 2020 which is it?
  2. Are you using Phoenix?
  3. What is the most recent version of Phoenix that you have used?
  4. Are you running Phoenix in production?
  5. How are you using Phoenix?
  6. Are you using Nerves?
  7. What is the most recent version of Nerves that you have used?
  8. Is your Nerves application distributed across many devices?
  9. Are you using Scenic?
  """

  use ExSurveyWeb, :live_view

  alias ExSurvey.Survey

  @questions [48, 49, 50, 51, 52, 53, 54, 56, 55]

  @impl true
  def mount(_params, _session, socket) do
    data =
      @questions
      |> Enum.map(&Survey.get_summary_map/1)

    {:ok, assign(socket, data: data)}
  end
end
