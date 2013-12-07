
require 'domain/bid'
require 'domain/player_stats'

class Player
  attr_reader :name, :player_stats, :hand
  attr_accessor :hand
  
  def initialize(name, strategy, maxCard, hand)
    @name = name
    @strategy = strategy
    @maxCard = maxCard
    @hand = hand
    @player_stats = PlayerStats.new()
  end    
  
  def get_bid(prizeCard)
    offer = @strategy.select_card(prizeCard, @hand, @maxCard)
    bid = Bid.new(offer, self)
    hand.delete(offer)
    return bid
  end
  
  def clear()
    @hand = []
    @player_stats.clear()
  end
end
