# frozen_string_literal: true

class User < Player
  def initialize(name, bank)
    @name = name
    super(bank)
  end
end
