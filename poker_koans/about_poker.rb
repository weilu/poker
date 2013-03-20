require File.expand_path(File.dirname(__FILE__) + '/edgecase')

# Implement a Hand Class here:
#
# class Hand
#   code ...
# end

class Hand
  include Comparable
  attr_reader :key_rank, :type_rank

  def initialize cards
    @key_rank, same_cards = cards.group_by{|i| card_rank(i)}.reduce do |memo, o|
      maxRank = memo.last.count
      currentRank = o.last.count
      maxRank < currentRank || (maxRank == currentRank && o.first > memo.first) ? o : memo
    end
    @type_rank = same_cards.count
  end

  def <=> another_hand
    if type_rank > another_hand.type_rank || (type_rank == another_hand.type_rank &&  key_rank > another_hand.key_rank)
      1
    elsif type_rank == another_hand.type_rank &&  key_rank == another_hand.key_rank
      0
    else
      -1
    end
  end

  private

  def card_rank card
    rank_map = (1..13).to_a
    card == 1 ? 13 : rank_map.index(card)
  end
end

class AboutPoker < EdgeCase::Koan
  def test_type_rank
    assert_equal 4, type_rank([2, 2, 2, 2, 11])
    assert_equal 4, type_rank([2, 2, 11, 2, 2])
    assert_equal 4, type_rank([2, 11, 2, 2, 2])

    assert_equal 3, type_rank([2, 2, 2, 11, 11])
    assert_equal 3, type_rank([2, 11, 2, 2, 11])
    assert_equal 3, type_rank([8, 8, 2, 2, 2])

    assert_equal 2, type_rank([2, 2, 13, 9, 11])
    assert_equal 2, type_rank([2, 11, 13, 2, 11])
    assert_equal 2, type_rank([2, 2, 11, 11, 8])

    assert_equal 1, type_rank([2, 3, 4, 5, 6])
  end

  def test_key_rank
    assert_equal 1, key_rank([2, 9, 9, 2, 2])
    assert_equal 11, key_rank([12, 9, 8, 9, 12])
    assert_equal 11, key_rank([9, 12, 8, 9, 12])
    assert_equal 13, key_rank([1, 1, 9, 2, 2])
  end

  def test_compare_hands
    assert_equal 1, winner([2, 2, 2, 2, 11], [3, 3, 3, 1, 1])
    assert_equal 2, winner([5, 11, 2, 4, 8], [9, 9, 1, 2, 3])
    assert_equal 2, winner([2, 2, 2, 2, 11], [13, 12, 12, 12, 12])
    assert_equal nil, winner([5, 11, 2, 4, 8], [8, 5, 11, 10, 7])
    assert_equal 1, winner([9, 9, 11, 11, 5], [10, 10, 1, 2, 3])
  end

  private

  def type_rank cards
    type_rank_pp cards
  end

  def key_rank cards
    key_rank_pp cards
  end

  def winner cards1, cards2
    winner_pp cards1, cards2
  end

  ## OOP implementation

  def type_rank_oop cards
    hand = Hand.new cards
    hand.type_rank
  end

  def key_rank_oop cards
    hand = Hand.new cards
    hand.key_rank
  end

  def winner_oop cards1, cards2
    hand1 = Hand.new cards1
    hand2 = Hand.new cards2

    hand1 > hand2 ? 1 : (hand1 < hand2 ? 2 : nil)
  end

  ## Procedural implementation

  def type_rank_pp cards
    counting_cards = {}
    cards.map do |card|
      counting_cards[card] ||= 0
      counting_cards[card] += 1
    end
    counting_cards.values.max
  end

  def key_rank_pp cards
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

  def winner_pp cards1, cards2
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
end

