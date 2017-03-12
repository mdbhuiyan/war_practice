class Player

require 'io/console'

  attr_reader :name
  attr_accessor :cards

  def initialize(name)
    @name = name
    @cards = []
  end

  def take_card(card)
    @cards << card
  end

  def play_turn
    puts "#{name}, press any key to show your next card!"
    STDIN.getch
  end

  def play_war
    puts "#{name}, press any key to place a card face down!"
    STDIN.getch
  end

end
