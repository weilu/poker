require './hand'

class PokerGame
  def self.play input = $stdin, output = $stdout
    begin
      output.puts "Enter the hand of player 1:"
      cards1 = input.gets.split(' ').map(&:to_i)
      type_rank1 = type_rank cards1
      key_rank1 = key_rank cards1

      output.puts "Enter the hand of player 2:"
      cards2 = input.gets.split(' ').map(&:to_i)
      type_rank2 = type_rank cards2
      key_rank2 = key_rank cards2

      output.puts "Player 1 has a hand of type rank #{type_rank1} and key card rank #{key_rank1}."
      output.puts "Player 2 has a hand of type rank #{type_rank2} and key card rank #{key_rank2}."

      winner = winner cards1, cards2
      if winner.nil?
        output.puts "There is a draw."
      else
        output.puts "Player #{winner} wins."
      end
    end while not input.gets.strip.empty?
  end
end

PokerGame.play
