class Hand
  include Comparable
  attr_reader :key_rank, :type_rank

  def initialize cards
    # code here
  end

  def <=> another_hand
    # code here
  end

  def to_s
    "type rank #{type_rank} and key card rank #{key_rank}"
  end
end

