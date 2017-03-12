require 'game'
require 'player'
require 'rspec'

describe 'Game' do
  subject(:game) { Game.new(player1, player2) }
  let(:player1)  { Player.new("Mindy") }
  let(:player2) { Player.new("Frankie") }


  describe "#initialize" do
    it "accepts two players" do
      expect(game.player1.name).to eq("Mindy")
      expect(game.player2.name).to eq("Frankie")
    end

    it "sets cards in play as an empty array" do
      expect(game.cards_in_play).to eq([])
    end

  end

  describe "#deal" do
    it "call's on the deck to deal cards to players"


  end

  describe "#play" do

    it "should give both players half of the deck" do
      allow(game).to receive(:won?).and_return(true)
      game.play
      expect(player1.cards.count == 26).to eq(true)
    end

  end

  describe "#play_turn" do

  end

  describe "#compare_cards" do
    it "Should call 'this is war' if cards 1 and 2 are of equal value"
  end

  describe "#round_over_message" do
    it "puts messages about the game's status to the terminal"

  end

  describe "this_is_war" do

  end

  describe "win_cards" do

  end

  describe "#play_face_up_card" do

  end

  describe "#play_face_down_card" do

  end

  describe "#won?" do
    it "returns true when one player has run out of cards" do
      player2.cards = []
      expect(game.won?).to be_truthy
    end

    it "returns false when both players still have cards" do
      card1 = double("card")
      card2 = double("card")
      player1.cards = [card1]
      player2.cards = [card2]
      expect(game.won?).to be_falsey
    end

  end

  describe "declare_winner" do
    it "proclaims the winner" do
    expect do
        game.declare_winner
      end.to output(" is the winner!\n").to_stdout
    end

  end


end
