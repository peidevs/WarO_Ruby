
# Public: This strategy interacts with a human.
#

class Console
  def select_card(prize_card, hand, max_card)
    puts "Card in play is #{prize_card}"
    puts "Your hand is #{hand * ','}"
    
    ok = false
    bid = -1
    
    while (!ok)
      puts "Enter your bid:"
      bid = STDIN.gets.to_i
      
      if (hand.include?(bid))
        ok = true
      end
    end
    
    return bid
  end
end