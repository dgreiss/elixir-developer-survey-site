defmodule ExSurveyWeb.ResourcesLive do
  # How did you first learn about Elixir?
  # What sources of information was most impactful for learning Elixir?
  # What part of Elixir did you find most difficult to learn?

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
