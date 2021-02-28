defmodule ExSurvey.Repo.Migrations.CreateResponses do
  use Ecto.Migration

  def change do
    create table(:responses) do
      add :response_id, :string
      add :start_date, :naive_datetime
      add :submit_date, :naive_datetime
      add :network_id, :string
      add :question_id, :integer
      add :answer, :text
      timestamps()
    end
  end
end
