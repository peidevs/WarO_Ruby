
require 'casino/dealer'
require 'domain/table'
require 'domain/player'

class Game
  def initialize
    @verbose = true  
  end
  
  def play_game(num_cards, players)
    dealer = Dealer.new()
    table = dealer.deal(num_cards, players)
    
    if (@verbose)
        puts "\n*** Game ***\n"
        puts "kitty: #{table.kitty * ','}"
        table.players.each do |p| 
          puts "#{p.name}: #{p.hand * ','}"
        end
    end
    
    dealer.play(table)
    determine_winner(table)
  end
  
  def determine_winner(table)
    kitty = table.kitty
    players = table.players
    
    winner = players.max_by { |player| player.player_stats.total }
    max = winner.player_stats.total
    
    if (@verbose) 
        players.each do |p|
            stats = p.player_stats
            puts "#{p.name} won #{stats.num_rounds_won} rounds with #{stats.total}"
        end                            
    end
    
    winner.player_stats.num_games_won = winner.player_stats.num_games_won + 1
    puts "Game summary:"
    puts "Overall winner is #{winner.name}"
  end
end