CONDITIONS = { 'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors' }
WINNING_MESSAGE = 'You won!'

def game_message(winning_choice)
  case winning_choice
  when 'p'
    'Paper wraps Rock!'
  when 'r'
    'Rock smashes Scissors!'
  when 's'
    'Scissors cut Paper!'
  end
end

def player_picks(player_choice, computer_choice)
  "You picked #{CONDITIONS[player_choice]} and computer picked #{CONDITIONS[computer_choice]}"
end


puts "Play Paper Rock Scissors!"

loop do

  begin
    print "Choose one: (R/P/S) "
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
