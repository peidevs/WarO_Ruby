
# Public: This strategy is to always play the lowest card in the hand.
#

class MinCard
  def select_card(prize_card, hand, max_card)
    return hand.min
  end
end