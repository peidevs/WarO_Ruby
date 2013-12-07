
# Public: This class constitutes many games of WarO. It delegates each game to Game.
#
# Examples

require 'config'
require 'casino/game'
require 'domain/player'

class Tourney
  def initialize(config) 
    @num_cards = config.num_cards
    @num_games = config.num_games
    @players = config.players
  end

  def play_games 
    @num_games.times { |i| play_game() }
    
    puts "Tourney summary:  "

    @players.each do |p| 
        puts "#{p.name} has #{p.player_stats.num_games_won} wins over #{@num_games} games"
    end  
  end
  
  def play_game 
    game = Game.new
    game.play_game(@num_cards, @players)
    
    @players.each { |p| p.clear() }
  end
end