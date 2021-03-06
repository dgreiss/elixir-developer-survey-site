defmodule ExSurveyWeb.ExperienceLive do
  @moduledoc """
  This page hase the following questions from the survey:
    1. How long have you been using Elixir?
    2. What is the most recent version of Elixir?
    3. Have you written Erlang?
    4. Have you written any other BEAM langs?
  """
  use ExSurveyWeb, :live_view

  alias ExSurvey.Survey

  @questions [5, 6, 9, 10]

  @impl true
  def mount(_params, _session, socket) do
    data =
      @questions
      |> Enum.map(&Survey.get_summary_map/1)

    {:ok, assign(socket, data: data)}
  end
end
