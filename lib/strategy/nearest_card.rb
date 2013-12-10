
# Public: This strategy is to play the card closest to the prize card.
#
# Examples
#  if prize card is 40 and hand is [12,35,46,60] return 35

class NearestCard
  def select_card(prize_card, hand, max_card)
    hand.min_by { |card| (card - prize_card).abs }
  end
end