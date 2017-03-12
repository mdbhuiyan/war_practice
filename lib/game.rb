require_relative 'player'
require_relative 'deck'
require_relative 'computer_player'
require 'byebug'

class Game

  attr_reader :player1, :player2
  attr_accessor :cards_in_play

  def initialize(player1 = Player.new("Bob"), player2 = Player.new("Frank"))
    @player1, @player2 = player1, player2
    @cards_in_play = []
  end

  def deal
    Deck.new.deal(player1, player2)
  end

  def play
    deal
    until won?
      play_turn
      @cards_in_play = []
    end
    declare_winner
  end

  def play_turn
      card1, card2 = play_face_up_card(player1), play_face_up_card(player2)
      system("clear")
      compare_cards(card1, card2)
  end

  def compare_cards(card1, card2)
    cards_in_play.concat([card1, card2])
    if card1.score > card2.score
      win_cards(player1)
      round_over_message(player1)
    elsif card2.score > card1.score
      win_cards(player2)
      round_over_message(player2)
    else
      this_is_war
    end
  end

  def round_over_message(winner)
    puts "#{winner.name} wins #{cards_in_play.count} cards."
    puts "\n"
    puts "#{player1.name} has #{player1.cards.count} cards."
    puts "#{player2.name} has #{player2.cards.count} cards."
    sleep(2)
    system("clear")
  end

  def this_is_war
    puts "This is war!"
    sleep(1)
    cards_in_play.concat([play_face_down_card(player1), play_face_down_card(player2)])
    card1, card2 = play_face_up_card(player1), play_face_up_card(player2)
    compare_cards(card1, card2)
  end

  def win_cards(player)
    cards_in_play.each { |card| card.revealed = false }

    player.cards.concat(cards_in_play)
  end

  def play_face_up_card(player)
    if player.play_turn
      card = player.cards.shift
      card.revealed = true
      card.display_card(player)
      sleep(1)
      card
    end
  end

  def play_face_down_card(player)
    if player.play_war
      card = player.cards.shift
      card.display_card(player)
      sleep(1)
      card
    end
  end

  def won?
    if player1.cards.count == 0
      @winner = "#{player1.name}"
      true
    elsif player2.cards.count == 0
      @winner = "#{player2.name}"
      true
    else
      false
    end
  end

  def declare_winner
    puts "#{winner} is the winner!"
  end

  private
  attr_accessor :winner

end

if __FILE__ == $PROGRAM_NAME
  Game.new(Player.new("Daenerys Targaryen"), ComputerPlayer.new("Tyrion Lannister")).play
end
