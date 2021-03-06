defmodule ExSurveyWeb.ResourcesLive do
  @moduledoc """
  This page has the following questions from the survey:
    1. How did you first learn about Elixir?
    2. What sources of information was most impactful for learning Elixir?
    3. What part of Elixir did you find most difficult to learn?
  """

  use ExSurveyWeb, :live_view

  alias ExSurvey.Survey

  @questions [7, 8, 15]

  @impl true
  def mount(_params, _session, socket) do
    data =
      @questions
      |> Enum.map(&Survey.get_summary_map/1)

    {:ok, assign(socket, data: data)}
  end
end
