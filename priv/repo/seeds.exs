alias ExSurvey.Repo
alias ExSurvey.Survey
alias ExSurvey.Survey.Response
alias NimbleCSV.RFC4180

"data/questions.csv"
|> File.stream!()
|> RFC4180.parse_stream()
|> Enum.map(fn [id, question] ->
  %{legacy_id: id, question: question}
  |> Survey.create_survey_question()
end)

"data/survey_summary.csv"
|> File.stream!()
|> RFC4180.parse_stream()
|> Enum.map(fn [id, answer, n, prop] ->
  %{
    question_id: id,
    answer: answer,
    n: n,
    prop: prop
  }
  |> Survey.create_response_summary()
end)

"data/survey.csv"
|> File.stream!()
|> RFC4180.parse_stream()
|> Stream.map(fn [id, start_date, submit_date, network_id, question_id, _question, answer] ->
  %{
    response_id: id,
    start_date: Timex.parse!(start_date, "{YYYY}-{0M}-{0D} {h24}:{m}:{s}"),
    submit_date: Timex.parse!(submit_date, "{YYYY}-{0M}-{0D} {h24}:{m}:{s}"),
    network_id: network_id,
    question_id: String.to_integer(question_id),
    answer: answer,
    inserted_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second),
    updated_at: NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)
  }
end)
|> Enum.chunk_every(8000)
|> Enum.each(fn rows ->
  Repo.insert_all(Response, rows)
end)
