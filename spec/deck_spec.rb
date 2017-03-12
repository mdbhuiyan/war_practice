require 'deck'
require 'player'

describe Deck do
  describe "#all_cards" do
    subject(:all_cards) { Deck.all_cards }

    it "starts with a count of 52" do
      expect(all_cards.count).to eq(52)
    end

    it "returns all cards without duplicates" do
      deduped_cards = all_cards
        .map { |card| [card.suit, card.value] }
        .uniq
        .count
      expect(deduped_cards).to eq(52)
    end
  end

  let(:cards) do
    cards = [
      Card.new(:spades, :king),
      Card.new(:spades, :queen),
      Card.new(:spades, :jack)
    ]
  end

  describe "#initialize" do
    it "by default fills itself with 52 cards" do
      deck = Deck.new
      expect(deck.count).to eq(52)
    end

    it "can be initialized with an array of cards" do
      deck = Deck.new(cards)
      expect(deck.count).to eq(3)
    end
  end

  let(:deck2) do
    Deck.new(cards.dup)
  end

  it "does not expose its cards directly" do
    expect(deck2).not_to respond_to(:cards)
  end

  describe "#empty" do

    it "returns true when the deck is fully dealt out to players" do
      expect(deck2.empty?).to be_falsey
    end
  end

  let(:player1) { double('player') }
  let(:player2) { double('player') }

  describe "#deal" do
    it "adds cards to players' hands" do
      allow(player1).to receive(:take_card).with(cards[0])
      deck2.deal(player1, player2)
    end
  end

end
