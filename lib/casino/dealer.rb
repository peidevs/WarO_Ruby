
require 'ostruct'

class Dealer
  def deal(num_cards, players)
    numPlayers = players.size()
    hands = deal_hands(num_cards, numPlayers)
    
    kitty = hands[0]
    playerHands = hands[1..hands.length]
    
    playerHands.each_with_index do |playerHand,index|
      players[index-1].hand = playerHand
    end
    
    table = Table.new(players, kitty)
    return table
  end

  def play(table) 
    table.kitty.each { |prize_card| play_round(prize_card, table.players) }
  end
  
  # TODO: these could be private  
  # TODO: return last expression ? (idiom)
  
  def play_round(prize_card, players)
    pair = find_round_winner(prize_card, players)
    winningBid = pair.winningBid
    winner = pair.winner
    winner.player_stats.num_rounds_won = winner.player_stats.num_rounds_won + 1
    winner.player_stats.total = winner.player_stats.total + prize_card
    
    puts "winner is #{winner.name} with bid #{winningBid} for prize #{prize_card}"
    return winner            
  end
  
  def find_round_winner(prize_card, players)
    result = OpenStruct.new()
    maxBid = 0
    
    players.each do |player|
      bid = player.get_bid(prize_card)
      
      # TODO: can we remove this if?
      if bid.offer > maxBid
        result.winner = bid.player
        result.winningBid = bid.offer
        maxBid = bid.offer
      end
    end
    
    return result
  end
  
  def deal_hands(num_cards, numPlayers)
    num_cards_in_hand = get_num_cards_in_hand(num_cards, numPlayers)
    virginDeck = (1..num_cards).to_a
    shuffledDeck = virginDeck.shuffle
    hands = shuffledDeck.each_slice(num_cards_in_hand).to_a
    return hands
  end
  
  def get_num_cards_in_hand(num_cards, numPlayers) 
    return (num_cards / (numPlayers + 1))
  end
end