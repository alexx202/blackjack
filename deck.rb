# frozen_string_literal: true

class Deck
  attr_accessor :deck

  CARD_MEANINGS = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze
  CARD_SUITS = %w[♠ ♥ ♣ ♦].freeze

  def initialize
    @deck = []
    CARD_MEANINGS.each do |meaning|
      CARD_SUITS.each do |suit|
        @deck << Card.new(suit, meaning)
      end
    end
    @deck.shuffle!
  end

  def give_card
    deck.pop
  end
end
