# frozen_string_literal: true

class Player
  attr_reader :name
  attr_accessor :cards, :bank, :points, :face_cards

  def initialize(bank)
    @bank = bank
    @cards = []
    @face_cards = []
    @points = 0
  end

  def add_card(card_deck)
    if cards.size < 3
      card = card_deck.give_card
      cards << card
      face_cards << card.meaning + card.suit
    end
  end

  def count_points
    @points = 0
    ace = false
    @cards.each do |card|
      if %w[J Q K].include?(card.meaning)
        @points += 10
      elsif card.meaning == 'A'
        ace = true
      else
        @points += card.meaning.to_i
      end
    end
    if ace
      @points += @points + 11 < 21 ? 11 : 1
    end
    @points
  end
end
