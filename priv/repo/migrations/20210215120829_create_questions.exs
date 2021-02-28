defmodule ExSurvey.Repo.Migrations.CreateQuestions do
  use Ecto.Migration

  def change do
    create table(:questions) do
      add :legacy_id, :integer
      add :question, :text
    end
  end
end
