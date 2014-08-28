json.array!(@schedules) do |schedule|
  json.extract! schedule, :id, :week, :game, :team0, :team1, :winner
  json.url schedule_url(schedule, format: :json)
end
