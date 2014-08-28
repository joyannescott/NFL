json.array!(@predictions) do |prediction|
  json.extract! prediction, :id, :week, :score, :game1, :game2, :game3, :game4, :game5, :game6, :game7, :game8, :game9, :game10, :game11, :game12, :game13, :game14, :game15, :game16
  json.url prediction_url(prediction, format: :json)
end
