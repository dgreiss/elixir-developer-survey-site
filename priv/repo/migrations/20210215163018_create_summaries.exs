defmodule ExSurvey.Repo.Migrations.CreateSummaries do
  use Ecto.Migration

  def change do
    create table(:summaries) do
      add :question_id, :integer
      add :answer, :text
      add :n, :integer
      add :prop, :float
      timestamps()
    end
  end
end
