
# Public: This class deals out the cards and plays one game.
#
# Examples

require 'ostruct'

class Dealer
  def deal(num_cards, players)
    num_players = players.size()
    hands = deal_hands(num_cards, num_players)
    
    kitty = hands[0]
    playerHands = hands[1..hands.length]
    
    playerHands.each_with_index do |playerHand,index|
      players[index-1].hand = playerHand
    end
    
    table = Table.new(players, kitty)
  end

  def play(table) 
    table.kitty.each { |prize_card| play_round(prize_card, table.players) }
  end
  
  # TODO: these could be private  
  # TODO: return last expression ? (idiom)
  
  def play_round(prize_card, players)
    pair = find_round_winner(prize_card, players)
    winning_bid = pair.winning_bid
    winner = pair.winner
    winner.player_stats.num_rounds_won = winner.player_stats.num_rounds_won + 1
    winner.player_stats.total = winner.player_stats.total + prize_card
    
    puts "winner is #{winner.name} with bid #{winning_bid} for prize #{prize_card}"
    winner            
  end
  
  def find_round_winner(prize_card, players)
    result = OpenStruct.new()
    max_bid = 0
    
    players.each do |player|
      bid = player.get_bid(prize_card)
      
      # TODO: can we remove this if?
      if bid.offer > max_bid
        result.winner = bid.player
        result.winning_bid = bid.offer
        max_bid = bid.offer
      end
    end
    
    result
  end
  
  def deal_hands(num_cards, num_players)
    num_cards_in_hand = get_num_cards_in_hand(num_cards, num_players)
    virgin_deck = (1..num_cards).to_a
    shuffled_deck = virgin_deck.shuffle
    hands = shuffled_deck.each_slice(num_cards_in_hand).to_a
    hands
  end
  
  def get_num_cards_in_hand(num_cards, num_players) 
    (num_cards / (num_players + 1))
  end
end