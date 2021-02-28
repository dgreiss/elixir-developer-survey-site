defmodule ExSurvey.Survey do
  alias ExSurvey.Survey.{Question, Response, Summary}
  alias ExSurvey.Repo
  import Ecto.Query

  def create_survey_question(attrs \\ %{}) do
    %Question{}
    |> Question.changeset(attrs)
    |> Repo.insert()
  end

  def create_survey_response(attrs \\ %{}) do
    %Response{}
    |> Response.changeset(attrs)
    |> Repo.insert()
  end

  def create_response_summary(attrs \\ %{}) do
    %Summary{}
    |> Summary.changeset(attrs)
    |> Repo.insert()
  end

  def get_question(id) do
    Repo.get_by!(Question, legacy_id: id)
  end

  def get_summary(question_id) do
    q =
      from s in Summary,
        where: [question_id: ^question_id]

    Repo.all(q)
  end
end
