defmodule ExSurvey.Survey.Response do
  use Ecto.Schema
  import Ecto.Changeset
  alias ExSurvey.Survey.{Question, Response}

  schema "responses" do
    field :response_id, :string
    field :start_date, :naive_datetime
    field :submit_date, :naive_datetime
    field :network_id, :string
    field :question_id, :integer
    field :answer, :string
    timestamps()

    has_many :question, Question, foreign_key: :legacy_id, references: :question_id
  end

  @doc false
  def changeset(%Response{} = response, attrs) do
    response
    |> cast(attrs, [:response_id, :start_date, :submit_date, :network_id, :question_id, :answer])
  end
end
