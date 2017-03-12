class Card

  VALUES = {
  :deuce => 2,
  :three => 3,
  :four  => 4,
  :five  => 5,
  :six   => 6,
  :seven => 7,
  :eight => 8,
  :nine  => 9,
  :ten   => 10,
  :jack  => 11,
  :queen => 12,
  :king  => 13,
  :ace => 14
}

  SUIT_STRINGS = {
    :clubs    => "♣",
    :diamonds => "♦",
    :hearts   => "♥",
    :spades   => "♠"
  }

  def self.suits
    SUIT_STRINGS.keys
  end

  def self.values
    VALUES.keys
  end

  def score
    VALUES[value]
  end

  attr_reader :suit, :value
  attr_accessor :revealed

  def initialize(suit, value)
    unless Card.suits.include?(suit) && Card.values.include?(value)
      raise "illegal suit (#{suit}) or value (#{value})."
    end

    @suit, @value = suit, value
    @revealed = false
  end

  def display_card(player)
    if self.revealed
      puts "#{player.name}'s card: #{self.value.to_s} of #{self.suit.to_s}."
    else
      puts "#{player.name} has added a face down card to the pile."
    end
  end


end
