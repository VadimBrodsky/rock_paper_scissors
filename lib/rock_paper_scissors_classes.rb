require 'pry'

class Hand
  HANDS = { 'p' => 'Paper', 'r' => 'Rock', 'sc' => 'Scissors',
            'sp' => 'Spock', 'l' => 'Lizard' }

  attr_reader :shape, :description

  def initialize(chosen_shape = nil)
    self.shape = chosen_shape
  end

  def throw_random
    @shape = HANDS.keys.sample
    @description = HANDS[self.shape]
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

class Player
  attr_accessor :name, :hand

  def initialize(name = nil, hand = nil)
    self.name = name
    self.hand = hand
  end

  def print_pick
    "=> #{self.name} picked #{self.hand.description}."
  end
end

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

  private

    WIN_CONDITIONS = { 'r' => ['l', 's'] ,'p' => ['r', 'sp'], 'sc' => ['p', 'l'],
                       'l' => ['p', 'sp'], 'sp' => ['r', 'sc'] }

    WIN_STATEMENTS = {['p',  'r' ]  => 'Paper wraps Rock!',
                      ['p',  'sp']  => 'Paper disproves Spock!',
                      ['r',  'sc']  => 'Rock smashes Scissors!',
                      ['r',  'l' ]  => 'Rock crushes Lizard!',
                      ['sc', 'p' ]  => 'Scissors cut Paper!',
                      ['sc', 'l' ]  => 'Scissors cut Lizard!',
                      ['l',  'p' ]  => 'Lizard eats Paper!',
                      ['l',  'sp']  => 'Lizard poisons Spock!',
                      ['sp', 'sc']  => 'Spock smashes Scissors!',
                      ['sp', 'r' ]  => 'Spock vaporizes Rock!'}

    def check_for_tie(player_1, player_2)
      if player_1.hand.shape == player_2.hand.shape
        @winner  = nil
        @statement = 'It\'s a tie.'
      end
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


class Game
  attr_reader :player_choice

  def initialize
  end

  def print_intro_message
    puts "Play Rock Paper Scissors Lizard Spock!"
  end

  def ask_player_input
    loop do
      print "Choose one: (R/P/Sc/L/Sp) "
      @player_choice = gets.chomp.downcase
      break if Hand.valid_shape?(@player_choice)
    end
  end
  
end
