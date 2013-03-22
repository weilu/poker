require File.expand_path(File.dirname(__FILE__) + '/hand')
require 'test/unit'

class AboutPoker < Test::Unit::TestCase
  def test_type_rank
    assert_equal 4, Hand.new([2, 11, 2, 2, 2]).type_rank
    assert_equal 3, Hand.new([2, 2, 2, 11, 11]).type_rank
    assert_equal 2, Hand.new([2, 2, 11, 11, 8]).type_rank
    assert_equal 1, Hand.new([2, 3, 4, 5, 6]).type_rank
  end

  def test_key_rank
    assert_equal 1, Hand.new([2, 9, 9, 2, 2]).key_rank
    assert_equal 11, Hand.new([9, 12, 8, 9, 12]).key_rank
    assert_equal 13, Hand.new([1, 1, 9, 2, 2]).key_rank
  end

  def test_compare_hands
    assert Hand.new([2, 2, 2, 2, 11]) > Hand.new([3, 3, 3, 1, 1])
    assert Hand.new([2, 2, 2, 2, 11]) < Hand.new([13, 12, 12, 12, 12])
    assert Hand.new([5, 11, 2, 4, 8]) == Hand.new([8, 5, 11, 10, 7])
  end
end

