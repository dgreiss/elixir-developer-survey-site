defmodule ExSurveyWeb.AdoptionLive do
  @moduledoc """
  This page has the following questions from the survey:
    1. Are you currently using Elixir?
    2. Can you share why you stopped using Elixir?
    3. What solutions was the Elixir Ecosystem Lacking?
    4. Which languages did you change to?
  """

  use ExSurveyWeb, :live_view

  alias ExSurvey.Survey

  @questions [1, 2, 3, 4]

  @impl true
  def mount(_params, _session, socket) do
    data =
      @questions
      |> Enum.map(&Survey.get_summary_map/1)

    {:ok, assign(socket, data: data)}
  end
end
