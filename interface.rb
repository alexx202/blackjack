# frozen_string_literal: true

class Interface
  attr_accessor :card_deck, :player, :dealer

  # rubocop:disable Metrics
  def initialize
    print 'Как вас зовут? '
    name = gets.strip
    print "Здравствуйте #{name}, сыграем в blackjack?(Y/N) "
    input = gets.strip
    if input.upcase == 'Y'
      @player = Player.new(name, 100)
      @dealer = Player.new('диллер', 100)
      make_new_game
    else
      exit
    end
    game
  end

  def game
    loop do
      player_move
      print 'Хотите сыграть еще?(Y/N) '
      input = gets.strip
      input.upcase == 'Y' ? make_new_game : break
    end
  end

  def make_new_game
    player.cards = []
    dealer.cards = []
    dealer.face_cards = []
    player.face_cards = []
    @card_deck = Deck.new
    2.times { player.add_card(card_deck) }
    2.times { dealer.add_card(card_deck) }
    player.make_bet
    dealer.make_bet
  end

  def player_move
    show_cards
    puts 'ВВедите 1 чтобы пропустить ход, 2 добавить карту, 3 открыть карты'
    input = gets.to_i
    case input
    when 1
      dealer_move
      player_move
    when 2
      player.add_card(card_deck)
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
  end

  def show_cards
    show_player_cards
    puts "Карты диллера: #{'*' * dealer.cards.size}"
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
    end
  end

  def scoring
    if player.count_points > dealer.count_points && player.count_points <= 21 && dealer.count_points <= 21
      player.take_bank
      puts 'Вы выйграли.'
    elsif dealer.count_points > player.count_points && dealer.count_points <= 21 && player.count_points <= 21
      dealer.take_bank
      puts 'Диллер выйграл.'
    elsif dealer.count_points > 21 && player.count_points <= 21
      player.take_bank
      puts 'Вы выйграли.'
    elsif player.count_points > 21 && dealer.count_points <= 21
      dealer.take_bank
      puts 'Диллер выйграл.'
    else
      player.take_bet
      dealer.take_bet
      puts 'Ничья, каждый получил свой банк назад'
    end
  end

  # rubocop:enable Metrics
  def open_cards
    scoring
    show_player_cards
    show_dealer_cards
    puts "Ваш банк: #{player.bank}"
    puts "Банк диллера: #{dealer.bank}"
    puts '-' * 40
  end
end
