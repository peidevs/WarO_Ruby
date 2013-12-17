
require 'domain/player_stats'

describe PlayerStats, "basic usage" do
  before(:each) do
    @player_stats = PlayerStats.new()
    @player_stats.total = 1
    @player_stats.num_games_won = 2
    @player_stats.num_rounds_won = 3    
  end
  
  it "should be initialized properly" do
    @player_stats.total.should == 1
    @player_stats.num_games_won.should == 2
    @player_stats.num_rounds_won.should == 3
  end
  
  it "should be cleared properly" do
    @player_stats.clear()
    @player_stats.total.should == 0
    @player_stats.num_rounds_won.should == 0
  end
end