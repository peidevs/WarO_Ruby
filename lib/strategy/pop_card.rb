
# Public: This strategy is to always play the 'next' card in the hand.
#

class PopCard
  def select_card(prize_card, hand, max_card)
    return hand[0]
  end
end