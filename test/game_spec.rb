
require 'casino/game'
require 'domain/player'
require 'strategy/pop_card'

describe Game, "basic usage" do
=begin
  it "should play a game with players using PopCard" do
    num_cards = 12
    strategy = PopCard.new()
    players = []
    players << Player.new("Bach", strategy, num_cards, [1,8,10])
    players << Player.new("Beethoven", strategy, num_cards, [2,7,12])
    players << Player.new("Mozart", strategy, num_cards, [3,6,11])
    game = Game.new()
    game.play_game(num_cards, players) 
    players[0].player_stats.num_games_won.should == 0
    players[1].player_stats.num_games_won.should == 1
    players[2].player_stats.num_games_won.should == 0
  end
=end
end