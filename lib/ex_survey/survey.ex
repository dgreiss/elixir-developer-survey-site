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
        join: q in Question,
        on: s.question_id == q.legacy_id,
        where: [question_id: ^question_id],
        order_by: s.prop,
        select: {q.question, s.n, s.prop, s.answer}

    Repo.all(q)
  end

  def get_summary_map(question_id) do
    question_id
    |> get_summary()
    |> to_map()
  end

  defp to_map(list) do
    list
    |> Enum.reduce(
      %{question: [], n: [], prop: [], labels: []},
      fn {question, n, prop, label}, acc ->
        %{
          question: question,
          n: [n | acc.n],
          prop: [Float.round(prop * 100, 2) | acc.prop],
          labels: [label | acc.labels]
        }
      end
    )
  end
end
