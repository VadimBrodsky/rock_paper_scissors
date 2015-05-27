require 'pry'

class Hand
  HANDS = { 'p' => 'Paper', 'r' => 'Rock', 'sc' => 'Scissors',
            'sp' => 'Spock', 'l' => 'Lizard' }

  attr_accessor :shape, :description

  def initialize
  end

  def throw_random
    self.shape = HANDS.keys.sample
    self.description = HANDS[self.shape]
  end
end

class Player
  attr_accessor :name, :hand

  def initialize=(name)
    self.name = name
  end
end

class Rules
  WIN_CONDITIONS = { 'r' => ['l', 's'] ,'p' => ['r', 'sp'], 'sc' => ['p', 'l'],
                     'l' => ['p', 'sp'], 'sp' => ['r', 'sc'] }

  WIN_STATEMNTS = {['p',  'r' ]  => 'Paper wraps Rock!',
                   ['p',  'sp']  => 'Paper disproves Spock!',
                   ['r',  'sc']  => 'Rock smashes Scissors!',
                   ['r',  'l' ]  => 'Rock crushes Lizard!',
                   ['sc', 'p' ]  => 'Scissors cut Paper!',
                   ['sc', 'l' ]  => 'Scissors cut Lizard!',
                   ['l',  'p' ]  => 'Lizard eats Paper!',
                   ['l',  'sp']  => 'Lizard poisons Spock!',
                   ['sp', 'sc']  => 'Spock smashes Scissors!',
                   ['sp', 'r' ]  => 'Spock vaporizes Rock!'}

  attr_reader :winner, :statment

  def initialize
  end

  def check_rules(player_1, player_2)
    check_for_tie(player_1, player_2) if @winner.nil?
    check_winner(player_1, player_2)  if @winner.nil?
    check_winner(player_2, player_1)  if @winner.nil?
  end

  private

    def check_for_tie(player_1, player_2)
      if player_1.hand.shape == player_2.hand.shape
        @winner  = 'None'
        @statment = 'It\'s a tie.'
      end
    end

    def check_winner(player_1, player_2)
      WIN_CONDITIONS.each do |key, value|
        if key == player_1.hand.shape && value.include?(player_2.hand.shape)
          @winner = player_1.name
          @statement = WIN_STATEMNTS[player_1.hand.shape, player_2.hand.shape]
          break
        end
      end
    end
end


class Game
  attr_reader :player_1, :player_2

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
  end

  def play_game
    check_for_tie(@player_1, @player_2)
    check_for_winner(@player_1, @player_2)

    result = Rules.new.check_rules(player_1, player_2)
    result.winner
    win.statment
  end

end

h1 = Hand.new
h1.throw_random

h2 = Hand.new
h2.throw_random

p1 = Player.new
p2 = Player.new

p1.name = 'Jonny'
p1.hand = h1

p2.name = 'Computer'
p2.hand = h2

# outcome = Rules.new
# p outcome.check_rules(p1, p2)

binding.pry
