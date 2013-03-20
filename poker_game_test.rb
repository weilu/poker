require 'test/unit'
require 'yaml'
require 'poker_game'
require 'stringio'

class TestHelper
  def self.run input_file
    output = StringIO.new
    File.open(input_file, 'r') do |f|
      PokerGame.play(f, output)
    end

    output.seek(0)
    output.read
  end
end

class PokerGameTest < Test::Unit::TestCase
  # for students
  def test_output
    actual_output = TestHelper.run 'test.in'
    expected_output = File.open('test.out')
    assert_equal expected_output.read, actual_output
  end

  # for us
  def test_full_output
    actual_output = TestHelper.run 'test_full.in'
    expected_output = File.open('test_full.out')
    assert_equal expected_output.read, actual_output
  end
end
