
# Public: This is the main entry point for WarO_Ruby. The program accepts
# a data file as an argument. This file is a Ruby DSL that sets # games, # cards,
# and specifies players.
#
# Examples
#
#   ruby -I lib bin/waro.rb config.txt

require 'config'
require 'casino/tourney'

# TODO: print usage if config file not provided
config_dsl_file = ARGV[0]
config = Config.new(config_dsl_file)
tourney = Tourney.new(config)
tourney.play_games()
