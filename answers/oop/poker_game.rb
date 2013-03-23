require File.expand_path(File.dirname(__FILE__) + '/hand')

class PokerGame
  def self.play input = $stdin, output = $stdout
    begin
      output.puts "Enter the hand of player 1:"
      cards1 = input.gets
      hand1 = Hand.new cards1.split(' ').map(&:to_i)

      output.puts "Enter the hand of player 2:"
      cards2 = input.gets
      hand2 = Hand.new cards2.split(' ').map(&:to_i)

      output.puts "Player 1 has a hand of #{hand1}."
      output.puts "Player 2 has a hand of #{hand2}."

      if hand1 == hand2
        output.puts "There is a draw."
      else
        output.puts "Player #{hand1 > hand2 ? 1: 2} wins."
      end
    end while not input.gets.strip.empty?
  end
end

