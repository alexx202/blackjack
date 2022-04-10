class Interface
  attr_accessor :card_deck, :bank_of_player, :bank_of_dealer, :player, :dealer

  loop do
    print "Как вас зовут? "
    name = gets.strip
    print "Здравствуйте #{name}, сыграем в blackjack? Y/N?"
    input = gets.strip
    input == Y ? run_game : break

  end

  def make_game(player_name)
    @card_deck = Cards.new
    @player = User.new(player_name, Bank.new)
    @dealer = Dealer.new(Bank.new)
    2.times { @player.cards << @card_deck.give_card }
    2.times { @dealer.cards << @card_deck.give_card }
    @player.bank.make_bet
    @dealer.bank.make_bet
  end

  def show_cards
    puts "Ваши карты: #{@player.cards.join(", ")}"
    puts "Карты диллера : * *"
  end


end
