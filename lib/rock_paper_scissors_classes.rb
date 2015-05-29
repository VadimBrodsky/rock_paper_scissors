# require 'pry'

# The hand shapes and descritions - act as game pieces
class Hand
  HANDS = { 'p' => 'Paper', 'r' => 'Rock', 'sc' => 'Scissors',
            'sp' => 'Spock', 'l' => 'Lizard' }

  attr_reader :shape, :description

  def initialize(chosen_shape = nil)
    self.shape = chosen_shape
  end

  def throw_random
    @shape = HANDS.keys.sample
    @description = HANDS[shape]
    self
  end

  def shape=(chosen_shape)
    if HANDS.key?(chosen_shape)
      @shape = chosen_shape
      @description = HANDS[chosen_shape]
    end
    self
  end

  def self.valid_shape?(shape)
    HANDS.key?(shape)
  end
end

# The player of the game, expects a name and a hand object
class Player
  attr_accessor :name, :hand

  def initialize(name = nil, hand = nil)
    self.name = name
    self.hand = hand
  end

  def to_s
    "=> #{name} picked #{hand.description}."
  end
end

# The rules of the game, who wins who and the description
class Rules
  attr_reader :winner, :statement

  def initialize
  end

  def check(player_1, player_2)
    check_for_tie(player_1, player_2) if @winner.nil?
    check_winner(player_1, player_2)  if @winner.nil?
    check_winner(player_2, player_1)  if @winner.nil?
    self
  end

  def to_s
    winner ? "#{statement}\n#{winner} won!" : "#{statement}"
  end

  private

  WIN_CONDITIONS = { 'r' => %w(l sc), 'p' => %w(r sp), 'sc' => %w(p l),
                     'l' => %w(p sp), 'sp' => %w(r sc) }

  WIN_STATEMENTS = {  %w(p  r )  => 'Paper wraps Rock!',
                      %w(p  sp)  => 'Paper disproves Spock!',
                      %w(r  sc)  => 'Rock smashes Scissors!',
                      %w(r  l )  => 'Rock crushes Lizard!',
                      %w(sc p )  => 'Scissors cut Paper!',
                      %w(sc l )  => 'Scissors cut Lizard!',
                      %w(l  p )  => 'Lizard eats Paper!',
                      %w(l  sp)  => 'Lizard poisons Spock!',
                      %w(sp sc)  => 'Spock smashes Scissors!',
                      %w(sp r )  => 'Spock vaporizes Rock!' }

  def check_for_tie(player_1, player_2)
    return unless player_1.hand.shape == player_2.hand.shape
    @winner  = nil
    @statement = 'It\'s a tie.'
  end

  def check_winner(player_1, player_2)
    WIN_CONDITIONS.each do |key, value|
      if key == player_1.hand.shape && value.include?(player_2.hand.shape)
        @winner = player_1.name
        @statement = WIN_STATEMENTS[[player_1.hand.shape, player_2.hand.shape]]
        break
      end
    end
  end
end

# The main game class, used for input and messaging
class Game
  attr_reader :player_choice
  attr_accessor :player_name

  def initialize
    clear_screen
    print_intro_message
  end

  def print_intro_message
    puts '####### ROCK / PAPER / SCISSORS / LIZARD /  SPOCK #######'
  end

  def clear_screen
    system('clear')
  end

  def ask_player_name
    print 'What is your name? '
    @player_name = gets.chomp.downcase.capitalize!
  end

  def ask_player_input
    loop do
      print 'Choose one: (R/P/Sc/L/Sp) '
      @player_choice = gets.chomp.downcase
      break if Hand.valid_shape?(@player_choice)
    end
  end

  def ask_play_again
    player_choice = ''
    loop do
      print 'Play again? (Y/N) '
      player_choice = gets.chomp.downcase
      break if player_choice == 'n' || player_choice == 'y'
    end
    player_choice == 'y'
  end

  def print_line_break
    puts ''
  end

  def print_bye
    puts 'Live long and prosper!'
  end
end
