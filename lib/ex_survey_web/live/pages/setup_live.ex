defmodule ExSurveyWeb.SetupLive do
  @moduledoc """
  This page has the following questions from the survey:
    1. Which operating system do you primarily develop on?
    2. Which editor/IDE do you primarily write Elixir with?
    3. How do you debug?
    4. Do you write tests?
    5. What database do you primarily use?
    6. If your team is enforcing code formatting what methods do you use?
  """

  use ExSurveyWeb, :live_view

  alias ExSurvey.Survey

  @questions [37, 38, 39, 42, 41, 47]

  @impl true
  def mount(_params, _session, socket) do
    data =
      @questions
      |> Enum.map(&Survey.get_summary_map/1)

    {:ok, assign(socket, data: data)}
  end
end
