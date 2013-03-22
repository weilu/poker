require 'test/unit'
require './hand'

class AboutPoker < Test::Unit::TestCase
  def test_type_rank
    assert_equal 4, type_rank([2, 11, 2, 2, 2])
    assert_equal 3, type_rank([2, 2, 2, 11, 11])
    assert_equal 2, type_rank([2, 2, 11, 11, 8])
    assert_equal 1, type_rank([2, 3, 4, 5, 6])
  end

  def test_key_rank
    assert_equal 1, key_rank([2, 9, 9, 2, 2])
    assert_equal 11, key_rank([9, 12, 8, 9, 12])
    assert_equal 13, key_rank([1, 1, 9, 2, 2])
  end

  def test_compare_hands
    assert_equal 1, winner([2, 2, 2, 2, 11], [3, 3, 3, 1, 1])
    assert_equal 2, winner([2, 2, 2, 2, 11], [13, 12, 12, 12, 12])
    assert_equal nil, winner([5, 11, 2, 4, 8], [8, 5, 11, 10, 7])
  end
end

