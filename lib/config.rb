
class Config
  attr_reader :num_cards, :num_games, :players
  attr_accessor :num_cards, :num_games, :players
  
  def initialize(config_file)
    num_cards = 0
    num_games = 0
    players = nil
    
    dsl_context = %q{
      require 'config'
      require 'domain/player'
      require 'casino/tourney'
      require 'strategy/max_card'
      require 'strategy/min_card'
      require 'strategy/nearest_card'
      require 'strategy/pop_card'

      pop_card_strategy = PopCard.new()
      min_card_strategy = MinCard.new()
      nearest_card_strategy = NearestCard.new()

      players = []      
    }
    
    config_text = File.open(config_file).read
    dsl_script = dsl_context + config_text
    
    # it's magic time: data as code
    eval(dsl_script, binding)  
    
    @num_cards = num_cards
    @num_games = num_games
    @players = players
    puts "num games: #{@num_games} , num cards: #{@num_cards}"
  end
end