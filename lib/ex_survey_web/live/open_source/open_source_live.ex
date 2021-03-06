defmodule ExSurveyWeb.OpenSourceLive do
  # Do you maintain any Open Source (OSS) Elixir libraries?
  # Have you made contributions to anyone else's OSS Elixir libraries?
  # Have you made OSS contributions back to Elixir?

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
