# require 'pry'
require_relative 'lib/rock_paper_scissors_classes'

rock_paper = Game.new
rock_paper.ask_player_name

loop do
  rock_paper.clear_screen
  rock_paper.ask_player_input
  rock_paper.print_line_break

  human = Player.new(rock_paper.player_name)
  human.hand = Hand.new(rock_paper.player_choice)

  computer = Player.new('Kirk')
  computer.hand = Hand.new.throw_random

  puts human
  puts computer
  rock_paper.print_line_break

  outcome = Rules.new
  outcome.check(human, computer)
  puts outcome
  rock_paper.print_line_break

  break unless rock_paper.ask_play_again
end

rock_paper.print_bye
