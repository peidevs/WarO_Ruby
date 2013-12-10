
# Public: This class presents a player in the game. It uses Bid for, well, bids, and
# PlayerStats for tracking totals. Crucially, it uses a 'strategy' to select a card
# from the hand.
#
# Examples

require 'domain/bid'
require 'domain/player_stats'

class Player
  attr_reader :name, :player_stats, :hand
  attr_accessor :max_card, :hand
  
  def initialize(name, strategy, maxCard = nil, hand = nil)
    @name = name
    @strategy = strategy
    @maxCard = maxCard
    @hand = hand
    @player_stats = PlayerStats.new()
  end    
  
  def get_bid(prizeCard)
    offer = @strategy.select_card(prizeCard, @hand, @maxCard)
    hand.delete(offer)
    bid = Bid.new(offer, self)
  end
  
  def clear()
    @hand = []
    @player_stats.clear()
  end
end
