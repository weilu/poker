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

  def to_s
    "type rank #{type_rank} and key card rank #{key_rank}"
  end

  private

  def card_rank card
    rank_map = (1..13).to_a
    card == 1 ?  13 : rank_map.index(card)
  end
end

