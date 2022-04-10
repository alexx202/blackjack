class Player
  attr_reader :name
  attr_accessor :cards, :bank
  def initialize(bank)
    @bank = bank
    @cards = []
  end

  def skip_turn

  end

  def add_card(card)
    cards << card if cards.size < 3
  end

  def open_cards

  end
end
