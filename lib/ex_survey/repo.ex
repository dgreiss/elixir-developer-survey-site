defmodule ExSurvey.Repo do
  use Ecto.Repo,
    otp_app: :ex_survey,
    adapter: Ecto.Adapters.Postgres
end
