require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

describe Player do
  before(:each) do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3) 
    @card3 = Card.new(:heart, 'Ace', 14)
    @deck = Deck.new([@card1, @card2, @card3])
    @player = Player.new('Clarisa', @deck)
  end

  describe '#initialize' do
    it 'exists and has attributes' do
      expect(@player).to be_a(Player)
      expect(@player.name).to eq('Clarisa')
      expect(@player.deck).to be_a(Deck)
    end
  end

  describe '#has_lost?' do
    it 'can determine if player have lost the game' do
      expect(@player.has_lost?).to eq(false)
      
      @player.deck.remove_card
      @player.deck.remove_card
      @player.deck.remove_card
      expect(@player.has_lost?).to be true
    end
  end
end