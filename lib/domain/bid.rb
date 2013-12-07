
class Bid
  attr_reader :offer, :player
  attr_accessor :offer, :player
  
  def initialize(offer, player) 
    @offer = offer
    @player = player
  end
end