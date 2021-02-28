defmodule ExSurvey.Survey.Summary do
  use Ecto.Schema
  import Ecto.Changeset

  schema "summaries" do
    field :question_id, :integer
    field :answer, :string
    field :n, :integer
    field :prop, :float
    timestamps()
  end

  @doc false
  def changeset(summary, attrs) do
    summary
    |> cast(attrs, [:question_id, :answer, :n, :prop])
  end
end
