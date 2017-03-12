require_relative 'card'

class Deck

  def self.all_cards
    cards = []
    Card.suits.each do |suit|
      Card.values.each do |value|
        cards << Card.new(suit, value)
      end
    end
    cards
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  def deal(player1, player2)
    cards.shuffle!
    until cards.empty?
      player1.take_card(cards.shift)
      player2.take_card(cards.shift)
    end
  end

  def count
    @cards.length
  end

  def empty?
    count == 0
  end

  private
  attr_reader :cards

end
