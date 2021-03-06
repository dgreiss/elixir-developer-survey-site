defmodule ExSurveyWeb.IndustryLive do
  @moduledoc """
  This page hase the following questions from the survey:
  1. What is your role within your company?
  2. Does your company use Elixir?
  3 How long has your company been using Elixir?
  4. What industry is your company in?
  5. In what capacities is your company using Elixir?
  6. How many engineers are using Elixir at your company?
  7. Did your company migrate from another language or choose Elixir for a new project?
  8. Did your company migrate from another language / framework?
  9. What outcomes did your team experience after adopting Elixir?
  10. Which reasons prevented Elixir from being adopted at your company?
  11. Can you say which language(s) and describe why it won?
  """

  use ExSurveyWeb, :live_view

  alias ExSurvey.Survey

  @questions [27, 28, 29, 26, 30, 31, 32, 33, 34, 35, 36]

  @impl true
  def mount(_params, _session, socket) do
    data =
      @questions
      |> Enum.map(&Survey.get_summary_map/1)

    {:ok, assign(socket, data: data)}
  end
end
