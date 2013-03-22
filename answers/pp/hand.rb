def type_rank cards
  counting_cards = Hash.new 0 # default value is 0
  cards.map do |card|
    counting_cards[card] += 1
  end
  counting_cards.values.max
end

def key_rank cards
  grouped_by_card_rank = cards.group_by do |card|
    card == 1 ? 13 : card - 1
  end
  key_rank, cards = grouped_by_card_rank.max_by do |card_rank, cards|
    cards.count * 100 + card_rank
  end
  key_rank
end

def winner cards1, cards2
  card1_ranks = [type_rank(cards1), key_rank(cards1)]
  card2_ranks = [type_rank(cards2), key_rank(cards2)]

  case card1_ranks <=> card2_ranks
  when 1
    1
  when 0
    nil
  when -1
    2
  end
end

