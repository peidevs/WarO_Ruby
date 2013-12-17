
require 'domain/player'
require 'test/unit'

class TestPlayer < Test::Unit::TestCase
  def test_get_bid
    player = Player.new()
    bid = player.get_bid()
    assert_equal(11, bid)
  end
end