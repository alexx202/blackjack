# frozen_string_literal: true

class Player
  attr_reader :name
  attr_accessor :cards, :bank, :points, :face_cards

  def initialize(name, bank)
    @name = name
    @bank = bank
    @cards = []
    @face_cards = []
    @points = 0
  end

  def add_card(card_deck)
    validate_number_cards!
    card = card_deck.give_card
    cards << card
    face_cards << card.meaning + card.suit
  end

  # rubocop:disable Metrics/MethodLength:
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

  # rubocop:enable Metrics/MethodLength:
  def make_bet
    validate_bank!
    self.bank -= 10
  end

  def take_bet
    self.bank += 10
  end

  def take_bank
    self.bank += 20
  end

  def validate_bank!
    raise 'Вы не можете больше играть, у вас нет денег' if self.bank.zero?
  end

  def validate_number_cards!
    raise 'Вы не можете брать больше 3 карт' if cards.size == 3
  end
end
