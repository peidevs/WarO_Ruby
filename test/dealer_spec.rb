
require 'casino/dealer'
require 'domain/player'
require 'domain/table'
require 'strategy/max_card'
require 'strategy/min_card'
require 'strategy/nearest_card'
require 'strategy/pop_card'

describe Dealer, "basic usage" do
  before(:each) do
    @num_cards = 12
    @players = []
    @max_card_strategy = MaxCard.new()
    @min_card_strategy = MinCard.new()
    @nearest_card_strategy = NearestCard.new()
    @pop_card_strategy = PopCard.new()
    @dealer = Dealer.new()
  end
  
  it "should play a game with players using PopCard" do
    @players << Player.new("Bach", @pop_card_strategy, @num_cards, [1,8,10])
    @players << Player.new("Beethoven", @pop_card_strategy, @num_cards, [2,7,12])
    @players << Player.new("Mozart", @pop_card_strategy, @num_cards, [3,6,11])
    kitty = [4,5,9]
    table = Table.new(@players, kitty)
    @dealer.play(table) 
    
    @players[0].player_stats.num_rounds_won.should == 1
    @players[0].player_stats.total.should == 5
    @players[1].player_stats.num_rounds_won.should == 1
    @players[1].player_stats.total.should == 9
    @players[2].player_stats.num_rounds_won.should == 1
    @players[2].player_stats.total.should == 4
  end
  
  it "should play a game with players using NearestCard" do
    @players << Player.new("Bach", @nearest_card_strategy, @num_cards, [1,8,10])
    @players << Player.new("Beethoven", @nearest_card_strategy, @num_cards, [2,7,12])
    @players << Player.new("Mozart", @nearest_card_strategy, @num_cards, [3,6,11])
    kitty = [4,5,9]
    table = Table.new(@players, kitty)
    @dealer.play(table)
    
    # plays: [1,2,3], [8,7,6], [10,12,11]
    @players[0].player_stats.num_rounds_won.should == 1
    @players[0].player_stats.total.should == 5
    @players[1].player_stats.num_rounds_won.should == 1
    @players[1].player_stats.total.should == 9
    @players[2].player_stats.num_rounds_won.should == 1
    @players[2].player_stats.total.should == 4
  end
  
  it "should play a game with players using MinCard" do
    @players << Player.new("Bach", @min_card_strategy, @num_cards, [3,6,10])
    @players << Player.new("Beethoven", @min_card_strategy, @num_cards, [2,11,12])
    @players << Player.new("Mozart", @min_card_strategy, @num_cards, [8,1,7])
    kitty = [4,5,9]
    table = Table.new(@players, kitty)
    @dealer.play(table)
    
    # plays: [3,2,1], [6,11,7], [10,12,8]
    @players[0].player_stats.num_rounds_won.should == 1
    @players[0].player_stats.total.should == 4
    @players[1].player_stats.num_rounds_won.should == 2
    @players[1].player_stats.total.should == 14
    @players[2].player_stats.num_rounds_won.should == 0
    @players[2].player_stats.total.should == 0
  end
  
  it "should deal cards to players and kitty" do
    @num_cards = 20
    @players << Player.new("Bach", nil, @num_cards)
    @players << Player.new("Beethoven", nil, @num_cards)
    @players << Player.new("Mozart", nil, @num_cards)
    table = @dealer.deal(@num_cards, @players)
    
    table.kitty.length.should == 5
    @players.each { |player| player.hand.length.should == 5 }    
  end
  
  it "should deal cards to players and kitty" do
    @num_cards = 60
    num_players = 4
    hands = @dealer.deal_hands(@num_cards, num_players)
    
    hands.length.should == 5
    hands.each { |hand| hand.length.should == 12 }
  end
  
  it "should compute number of cards when even" do
    @num_cards = 60
    num_players = 4
    result = @dealer.get_num_cards_in_hand(@num_cards, num_players)
    
    result.should == 12
  end
  
  it "should compute number of cards when odd" do
    @num_cards = 24
    num_players = 4
    result = @dealer.get_num_cards_in_hand(@num_cards, num_players)
    
    result.should == 4
  end
end