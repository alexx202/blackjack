# frozen_string_literal: true

class Interface
  attr_accessor :card_deck, :bank_of_player, :bank_of_dealer, :player, :dealer

  def initialize
    print 'Как вас зовут? '
    name = gets.strip
    print "Здравствуйте #{name}, сыграем в blackjack?(Y/N) "
    input = gets.strip
    input.upcase == 'Y' ? make_game(name) : exit
    game
  end

  def game
    loop do
      player_move
      print 'Хотите сыграть еще?(Y/N) '
      input = gets.strip
      input.upcase == Y ? make_game : break
    end
  end

  def make_game(player_name)
    @card_deck = Deck.new
    @player = User.new(player_name, Bank.new)
    @dealer = Dealer.new(Bank.new)
    2.times { @player.add_card(card_deck) }
    2.times { @dealer.add_card(card_deck) }
    @player.bank.make_bet
    @dealer.bank.make_bet
  end

  def player_move
    show_player_cards
    puts 'ВВедите 1 чтобы пропустить ход, 2 добавить карту, 3 открыть карты'
    input = gets.to_i
    case input
    when 1
      dealer_move
      player_move
    when 2
      @player.add_card
      dealer_move
      open_cards
    when 3
      open_cards
    end
  end

  def show_player_cards
    puts "Ваши карты: #{@player.face_cards}"
    print 'Количество очков у вас: '
    puts player.count_points
    puts 'Карты диллера: * *'
  end

  def show_dealer_cards
    puts "Карты диллера: #{@dealer.face_cards}"
    print 'Количество очков у диллера: '
    puts dealer.count_points
  end

  def dealer_move
    if dealer.points >= 17
      open_cards
    elsif dealer.points < 17
      dealer.add_card(card_deck)
      puts 'Диллер взял карту'
    end
  end

  def open_cards
    if player.points > dealer.points
      player.bank.give_bank
      puts 'Вы выйграли.'
    elsif dealer.points > player.points
      dealer.bank.give_bank
      puts 'Диллер выйграл.'
    else
      player.bank.take_bet
      dealer.bank.take_bet
      puts 'Ничья, каждый получил свой банк назад'
    end
    show_dealer_cards
  end
end
