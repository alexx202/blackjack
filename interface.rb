class Interface
  loop do
    print "Как вас зовут? "
    name = gets.strip
    print "Здравствуйте #{name}, сыграем в blackjack? Y/N?"
    input = gets.strip
    input == Y ? run_game : break

  end


end
