
class NearestCard
  def select_card(prize_card, hand, max_card)
    return hand.min_by { |card| (card - prize_card).abs }
  end
end