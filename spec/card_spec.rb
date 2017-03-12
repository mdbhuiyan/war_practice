require 'card'
require 'player'
require 'rspec'

describe Card do
  subject(:card1) { Card.new(:clubs, :three) }
  subject(:card2) { Card.new(:spades, :ace) }

  let(:player) do
      player = Player.new("Stephanie")
    end

  describe "#initialize" do

    it "assigns the suit" do
      expect(card1.suit).to eq(:clubs)
    end

    it "assigns the value" do
      expect(card1.value).to eq(:three)
    end

    it "initializes cards face down" do
      expect(card1.revealed).to be_falsey
    end

    context "when there is an error" do

      it "does not accept an invalid suit argument" do
        expect{ Card.new(:banana, :three) }.to raise_error(RuntimeError)
      end

      it "does not accept an invalid value argument" do
        expect{ Card.new(:clubs, :orange) }.to raise_error(RuntimeError)
      end

    end
  end

  describe "#display_card" do

    before do
      card1.revealed = true
      end

    it "displays a card's value and suit if the card is face up" do
      expect do
          card1.display_card(player)
        end.to output("Stephanie's card: three of clubs.\n").to_stdout
      end

    it "informs players if a card has been placed on the table face down" do
      expect do
          card2.display_card(player)
        end.to output("Stephanie has added a face down card to the pile.\n").to_stdout
      end

    end

end
