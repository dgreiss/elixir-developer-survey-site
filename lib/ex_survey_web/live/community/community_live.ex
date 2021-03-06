defmodule ExSurveyWeb.CommunityLive do
  # How often do you attend local Elixir meetups?
  # Do you help organize Elixir meetups?
  # Do you attend your continent's major Elixir Conference?
  # Do you attend any regional Elixir/Erlang conferences?
  # Do you participate in any online Elixir chats?
  # Which Elixir Podcasts do you listen to?
  # Which Elixir newsletters are you subscribed to?

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
