class Player
  attr_reader :name
  attr_accessor :cards, :bank
  def initialize(bank)
    @bank = bank
    @cards = []
    @face_cards = []
    @points = 0
  end

  def add_card(card)
    cards << card if cards.size < 3
  end

  def open_cards

  end

  def points
    @cards.each do |card|
      if card.meaning == "A"

    end
  end

  def show_cards
    self.cards.each do |card|
      @face_cards << card.meaning + card.suit
    end
    @face_cards
  end

end
