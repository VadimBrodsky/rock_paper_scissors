CONDITIONS = { 'p' => 'Paper', 'r' => 'Rock', 'sc' => 'Scissors', 'sp' => 'Spock', 'l' => 'Lizard' }
WINNING_MESSAGE = 'You won!'

WIN_CONDITIONS = []

def game_message(winning_choice, losing_choice)
  case winning_choice
  when 'p' && losing_choice == 'r'
    'Paper wraps Rock!'
  when 'p' && losing_choice == 'sp'
    'Paper disproves Spock!'
  when 'r' && losing_choice == 'sc'
    'Rock smashes Scissors!'
  when 'r' && losing_choice == 'l'
    'Rock crushes Lizard!'
  when 'sc' && losing_choice == 'p'
    'Scissors cut Paper!'
  when 'sc' && losing_choice == 'l'
    'Scissors cut Lizard!'
  when 'l' && losing_choice == 'p'
    'Lizard eats Paper!'
  when 'l' && losing_choice == 'sp'
    'Lizard poisons Spock!'
  when 'sp' && losing_choice == 'sc'
    'Spock smashes Scissors!'
  when 'sp' && losing_choice == 'r'
    'Spock vaporizes Rock!'
  end
end

def player_picks(player_choice, computer_choice)
  "You picked #{CONDITIONS[player_choice]} and computer picked #{CONDITIONS[computer_choice]}"
end


puts "Play Rock Paper Scissors Lizard Spock!"

loop do

  begin
    print "Choose one: (R/P/Sc/L/Sp) "
    player_choice = gets.chomp.downcase
  end until CONDITIONS.keys.include?(player_choice)

  computer_choice = CONDITIONS.keys.sample

  case
  when player_choice == computer_choice
    puts player_picks(player_choice, computer_choice)
    puts "It's a tie."
  when player_choice == 'p' && computer_choice == 'r'
    puts player_picks(player_choice, computer_choice)
    puts WINNING_MESSAGE
    puts game_message(player_choice)
  when player_choice == 'r' && computer_choice == 's'
    puts player_picks(player_choice, computer_choice)
    puts WINNING_MESSAGE
    puts game_message(player_choice)
  when player_choice == 's' && computer_choice == 'r'
    puts player_picks(player_choice, computer_choice)
    puts WINNING_MESSAGE
    puts game_message(player_choice)
  else
    puts player_picks(player_choice, computer_choice)
    puts "Computer won!"
    puts game_message(computer_choice)
  end

  print "Play again? (Y/N) "
  play_again = gets.chomp.downcase
  break if play_again != 'y'
  puts "-----------------------"

end

puts "Bye!"
