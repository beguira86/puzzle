json.games @games do |game|
  json.username game.user.username
  json.time game.time

end