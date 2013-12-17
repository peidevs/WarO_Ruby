
require 'domain/player'
require 'strategy/pop_card'
require 'strategy/max_card'

describe Player, "basic usage" do
  it "should be initialized properly" do
    player = Player.new("Mozart", nil, 5, [1,2,3,4,5])
    player.name.should == "Mozart"
  end
  
  it "should clear the hand and player stats" do
    player = Player.new("Mozart", nil, 5, [1,2,3,4,5])
    player.clear()
    player.hand.should == []
    player.player_stats.total == 0
  end
  
  it "should pop the first card with pop strategy" do
    strategy = PopCard.new()
    player = Player.new("Mozart", strategy, 10, [1,2,3,4,5])
    bid = player.get_bid(8)
    bid.offer.should == 1
    bid.player.should == player
  end
  
  it "should use highest card with max strategy" do
    strategy = MaxCard.new()
    player = Player.new("Mozart", strategy, 10, [3,4,5,2,1])
    bid = player.get_bid(8)
    bid.offer.should == 5
    bid.player.should == player
  end
  
end