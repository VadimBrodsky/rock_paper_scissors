#
####### ROCK / PAPER / SCISSORS / SPOCK / LIZARD #######
#           :                                 :
#         :                                   :
#         :  RRVIttIti+==iiii++iii++=;:,       :
#         : IBMMMMWWWWMMMMMBXXVVYYIi=;:,        :
#         : tBBMMMWWWMMMMMMBXXXVYIti;;;:,,      :
#         t YXIXBMMWMMBMBBRXVIi+==;::;::::       ,
#        ;t IVYt+=+iIIVMBYi=:,,,=i+=;:::::,      ;;
#        YX=YVIt+=,,:=VWBt;::::=,,:::;;;:;:     ;;;
#        VMiXRttItIVRBBWRi:.tXXVVYItiIi==;:   ;;;;
#        =XIBWMMMBBBMRMBXi;,tXXRRXXXVYYt+;;: ;;;;;
#         =iBWWMMBBMBBWBY;;;,YXRRRRXXVIi;;;:;,;;;=
#          iXMMMMMWWBMWMY+;=+IXRRXXVYIi;:;;:,,;;=
#          iBRBBMMMMYYXV+:,:;+XRXXVIt+;;:;++::;;;
#          =MRRRBMMBBYtt;::::;+VXVIi=;;;:;=+;;;;=
#           XBRBBBBBMMBRRVItttYYYYt=;;;;;;==:;=
#            VRRRRRBRRRRXRVYYIttiti=::;:::=;=
#             YRRRRXXVIIYIiitt+++ii=:;:::;==
#             +XRRXIIIIYVVI;i+=;=tt=;::::;:;
#              tRRXXVYti++==;;;=iYt;:::::,;;
#               IXRRXVVVVYYItiitIIi=:::;,::;
#                tVXRRRBBRXVYYYIti;::::,::::
#                 YVYVYYYYYItti+=:,,,,,:::::;
#                 YRVI+==;;;;;:,,,,,,,:::::::

# Game pieces
CONDITIONS = { 'p' => 'Paper', 'r' => 'Rock', 'sc' => 'Scissors',
              'sp' => 'Spock', 'l' => 'Lizard' }


# Who beats who
WIN_CONDITIONS = { 'r' => ['l', 's'] ,'p' => ['r', 'sp'], 'sc' => ['p', 'l'],
                   'l' => ['p', 'sp'], 'sp' => ['r', 'sc'] }


# Winning statements
WIN_STATEMNTS = { ['p', 'r']   => 'Paper wraps Rock!',
                  ['p', 'sp']  => 'Paper disproves Spock!',
                  ['r', 'sc']  => 'Rock smashes Scissors!',
                  ['r', 'l']   => 'Rock crushes Lizard!',
                  ['sc', 'p']  => 'Scissors cut Paper!',
                  ['sc', 'l']  => 'Scissors cut Lizard!',
                  ['l', 'p']   => 'Lizard eats Paper!',
                  ['l', 'sp']  => 'Lizard poisons Spock!',
                  ['sp', 'sc'] => 'Spock smashes Scissors!',
                  ['sp', 'r']  => 'Spock vaporizes Rock!'}


# User messages
WINNING_MESSAGE = 'You won!'
LOSING_MESSAGE = 'Computer won!'
TIE_MESSAGE = "It's a tie."


# Determines the winner in terms of player_1
def game_winner(player_1, player_2)
  game_outcome = ''

  if player_1 == player_2
    game_outcome = TIE_MESSAGE
  else
    WIN_CONDITIONS.each do |key, value|
      if key == player_1 && value.include?(player_2)
        game_outcome = WINNING_MESSAGE
        break
      else
        game_outcome = LOSING_MESSAGE
        break
      end
    end
  end
  game_outcome
end


# Find the correct Winning Statement
def game_message(winning_choice, losing_choice)
  if WIN_STATEMNTS.has_key?([winning_choice, losing_choice])
    WIN_STATEMNTS[[winning_choice, losing_choice]]
  else
    WIN_STATEMNTS[[losing_choice, winning_choice]]
  end
end


# Formats the pieces that the user / computers picked
def player_picks(player_choice, computer_choice)
  "You picked #{CONDITIONS[player_choice]} and computer picked #{CONDITIONS[computer_choice]}"
end


puts "Play Rock Paper Scissors Lizard Spock!"


# Main game loop
loop do

  begin
    print "Choose one: (R/P/Sc/L/Sp) "
    player_choice = gets.chomp.downcase
  end until CONDITIONS.keys.include?(player_choice)

  computer_choice = CONDITIONS.keys.sample

  puts player_picks(player_choice, computer_choice)
  puts game_winner(player_choice, computer_choice)
  if player_choice != computer_choice
    puts game_message(player_choice, computer_choice)
  end

  print "Play again? (Y/N) "
  play_again = gets.chomp.downcase
  break if play_again != 'y'
  puts "-----------------------"

end

puts "Live long and prosper!"
