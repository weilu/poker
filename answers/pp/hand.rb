def type_rank cards
  counting_cards = {}
  cards.map do |card|
    counting_cards[card] ||= 0
    counting_cards[card] += 1
  end
  counting_cards.values.max
end

def key_rank cards
  counting_cards = {}
  cards.map do |card|
    card_rank = card == 1 ? 13 : card - 1
    counting_cards[card_rank] ||= 0
    counting_cards[card_rank] += 1
  end
  best_card_count = counting_cards.reduce do |memo, card_count|
    if (card_count[1] > memo[1]) || (card_count[1] == memo[1] && card_count[0] > memo[0])
      card_count
    else
      memo
    end
  end
  best_card_count[0]
end

def winner cards1, cards2
  type_rank1 = type_rank(cards1)
  type_rank2 = type_rank(cards2)

  if type_rank1 > type_rank2
    1
  elsif type_rank1 < type_rank2
    2
  else
    key_rank1 = key_rank(cards1)
    key_rank2 = key_rank(cards2)

    key_rank1 > key_rank2 ? 1 : (key_rank1 < key_rank2 ? 2 : nil)
  end
end

