defmodule ExSurveyWeb.OpenSourceLive do
  @moduledoc """
  This page has the following questions from the survey:
    1. Do you maintain any Open Source (OSS) Elixir libraries?
    2. Have you made contributions to anyone else's OSS Elixir libraries?
    3. Have you made OSS contributions back to Elixir?
  """
  use ExSurveyWeb, :live_view

  alias ExSurvey.Survey

  @questions [16, 17, 18]

  @impl true
  def mount(_params, _session, socket) do
    data =
      @questions
      |> Enum.map(&Survey.get_summary_map/1)

    {:ok, assign(socket, data: data)}
  end
end
