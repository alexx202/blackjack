# frozen_string_literal: true

class Bank
  class << self
    attr_accessor :common_bank
  end

  attr_accessor :bank

  def initialize
    @bank = 100
  end

  def make_bet
    self.class.common_bank ||= 0
    self.bank -= 10
    self.class.common_bank += 10
  end

  def take_bet
    self.bank += 10
    self.class.common_bank -= 10
  end

  def give_bank
    self.bank += self.class.common_bank
    self.class.common_bank = 0
  end
end
