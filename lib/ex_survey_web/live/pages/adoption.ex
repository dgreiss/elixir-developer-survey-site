defmodule ExSurveyWeb.AdoptionLive do
  # Are you currently using Elixir?
  # Can you share why you stopped using Elixir?
  # What solutions was the Elixir Ecosystem Lacking?
  # Which languages did you change to?

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

  defp to_map(list) do
    list
    |> Enum.reduce(%{data: [], labels: []}, fn result, acc ->
      %{
        data: [Float.round(result.prop * 100, 2) | acc.data],
        labels: [result.answer | acc.labels]
      }
    end)
  end
end
