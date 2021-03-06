defmodule ExSurveyWeb.CommunityLive do
  @moduledoc """
  This page has the following questions from the survey:
    1. How often do you attend local Elixir meetups?
    2. Do you help organize Elixir meetups?
    3. Do you attend your continent's major Elixir Conference?
    4. Do you attend any regional Elixir/Erlang conferences?
    5. Do you participate in any online Elixir chats?
    6. Which Elixir Podcasts do you listen to?
    7. Which Elixir newsletters are you subscribed to?
  """

  use ExSurveyWeb, :live_view

  alias ExSurvey.Survey

  @questions [19, 20, 21, 22, 23, 24, 25]

  @impl true
  def mount(_params, _session, socket) do
    data =
      @questions
      |> Enum.map(&Survey.get_summary_map/1)

    {:ok, assign(socket, data: data)}
  end
end
