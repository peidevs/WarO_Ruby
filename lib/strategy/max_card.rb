
# Public: This strategy is to always play the highest card in the hand.
#

class MaxCard
  def select_card(prize_card, hand, max_card)
    return hand.max
  end
end