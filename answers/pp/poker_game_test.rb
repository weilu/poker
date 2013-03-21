require 'test/unit'
require 'stringio'

def expand_path relative_path
  File.expand_path(relative_path, File.dirname(__FILE__))
end
require expand_path('./poker_game')

class TestHelper
  class << self
    def run input_file
      output = StringIO.new
      File.open(expand_path(input_file), 'r') do |f|
        PokerGame.play(f, output)
      end

      output.seek(0)
      output.read
    end
  end
end

class PokerGameTest < Test::Unit::TestCase
  def test_full_output
    actual_output = TestHelper.run('../test_full.in')
    expected_output = File.open expand_path('../test_full.out')
    assert_equal expected_output.read, actual_output
  end
end

#PokerGame.play
