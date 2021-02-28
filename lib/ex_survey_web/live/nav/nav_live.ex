defmodule ExSurveyWeb.NavLive do
  use ExSurveyWeb, :live_view
  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
