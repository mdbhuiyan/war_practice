require_relative 'player'
require_relative 'deck'
require_relative 'computer_player'
require 'byebug'

class Game

  def initialize

  end

  def deal

  end

  def play

  end

  def play_turn

  end

  def compare_cards

  end

  def round_over_message(winner)

  end

  def this_is_war

  end

  def win_cards

  end

  def play_face_up_card

  end

  def play_face_down_card

  end

  def won?

  end

  def declare_winner

  end


end

if __FILE__ == $PROGRAM_NAME
  Game.new(Player.new("Davos Seaworth"), ComputerPlayer.new("Tyrion Lannister")).play
end
