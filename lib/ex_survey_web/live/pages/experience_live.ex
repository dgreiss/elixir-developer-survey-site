defmodule ExSurveyWeb.ExperienceLive do
  # How long have you been using Elixir?
  # What is the most recent version of Elixir?
  # Have you written Erlang?
  # Have you written any other BEAM langs?

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
