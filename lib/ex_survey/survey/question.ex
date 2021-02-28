defmodule ExSurvey.Survey.Question do
  use Ecto.Schema
  import Ecto.Changeset
  alias ExSurvey.Survey.Question

  schema "questions" do
    field :legacy_id, :integer
    field :question, :string
  end

  @doc false
  def changeset(%Question{} = question, attrs) do
    question
    |> cast(attrs, [:legacy_id, :question])
    |> validate_required([:question])
  end
end
