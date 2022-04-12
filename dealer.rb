# frozen_string_literal: true

class Dealer < Player
  def initialize(bank)
    @name = 'dealer'
    super(bank)
  end
end
