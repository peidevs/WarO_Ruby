
class Table
  attr_reader :players, :kitty
  
  def initialize(players, kitty)
    @players = players
    @kitty = kitty
  end  
end