require 'minitest/autorun'
require 'rock_paper_scissors_classes'

# Testing BlackJack Methods
class GameTest < Minitest::Test
  def setup
    @h1 = Hand.new('r')
    @h2 = Hand.new('p')
    @h3 = Hand.new('sc')
    @p1 = Player.new('Kirk',   @h1)
    @p2 = Player.new('Picard', @h2)
    @rules = Rules.new
  end

  def test_player_init
    assert_equal @p1.name, 'Kirk'
    refute_equal @p1.name, 'SOMETHING ELSE'
  end

  def test_hand_init_valid
    valid_hand = Hand.new('r')
    assert_equal valid_hand.shape, 'r'
  end

  def test_hand_init_invalid
    valid_hand = Hand.new('LAZER')
    refute_equal valid_hand.shape, 'LAZER'
  end

  def test_player_should_win
    assert_equal @rules.check(@p1, @p2).winner, @p2.name
    assert_equal @rules.check(@p2, @p1).winner, @p2.name
  end

  def test_tie_game
    data = Player.new('Data', @h1)
    assert_equal @rules.check(@p1, data).winner, nil
  end
end
