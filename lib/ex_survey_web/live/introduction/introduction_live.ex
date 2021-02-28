defmodule ExSurveyWeb.IntroductionLive do
  use ExSurveyWeb, :live_view

  alias ExSurvey.Survey

  @impl true
  def mount(_params, _session, socket) do
    chart_data =
      Survey.get_summary(1)
      |> Enum.reduce(%{data: [], labels: []}, fn result, acc ->
        %{
          data: [Float.round(result.prop * 100, 2) | acc.data],
          labels: [result.answer | acc.labels]
        }
      end)

    {:ok,
     socket
     |> assign(
       question_1: Survey.get_question(1),
       data: chart_data
     )}
  end
end
