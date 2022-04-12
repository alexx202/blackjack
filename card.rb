# frozen_string_literal: true

class Card
  attr_reader :suit, :meaning

  def initialize(suit, meaning)
    @suit = suit
    @meaning = meaning
  end
end
