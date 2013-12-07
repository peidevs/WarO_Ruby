
require 'config'
require 'casino/tourney'

config_dsl_file = ARGV[0]
config = Config.new(config_dsl_file)
tourney = Tourney.new(config)
tourney.play_games()
