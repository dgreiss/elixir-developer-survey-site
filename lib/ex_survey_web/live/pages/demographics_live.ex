defmodule ExSurveyWeb.DemographicsLive do
  @moduledoc """
  This page has the following questions from the survey:
    1. What is your age range?
    2. Which gender do you identify as?
    3. In which country do you reside?
    4. Do you have a college degree in CS?
  """
  use ExSurveyWeb, :live_view

  alias ExSurvey.Survey

  @questions [11, 12, 13, 14]

  @impl true
  def mount(_params, _session, socket) do
    data =
      @questions
      |> Enum.map(&Survey.get_summary_map/1)

    {:ok, assign(socket, data: data)}
  end
end
