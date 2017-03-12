require 'player'
require 'card'
require 'rspec'

describe Player do
  subject(:player) { Player.new("Stephanie") }

  describe "#initialize" do

    it "assigns the name" do
      expect(player.name).to eq("Stephanie")
    end

    it "sets initial card pile to be empty" do
      expect(player.cards).to eq([])
    end

  end

  describe "#take_card" do

    it "adds a card to the player's pile" do
      player.take_card(Card.new(:clubs, :three))
      expect(player.cards.length).to eq(1)
    end


  end

end
