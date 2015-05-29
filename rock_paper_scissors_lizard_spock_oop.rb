require 'pry'
require_relative 'lib/rock_paper_scissors_classes'

rock_paper = Game.new
rock_paper.print_intro_message
rock_paper.ask_player_input

# p rock_paper.player_choice
# binding.pry
