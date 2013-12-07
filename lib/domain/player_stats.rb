
class PlayerStats
  attr_reader :total, :num_games_won, :num_rounds_won
  attr_accessor :total, :num_games_won, :num_rounds_won

  def initialize()
    @total = 0
    @num_games_won = 0
    @num_rounds_won = 0
  end           
  
  def clear()
    @total = 0
    @num_rounds_won = 0
  end 
end
