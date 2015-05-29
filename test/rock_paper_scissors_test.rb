require 'minitest/autorun'
require 'rock_paper_scissors_classes'

# Testing BlackJack Methods
class GameTest < Minitest::Test
  def setup
    @h1 = Hand.new('r')
    @h2 = Hand.new('p')
    @h3 = Hand.new('sc')
    @h4 = Hand.new('l')
    @h5 = Hand.new('sp')
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

  def test_rock_wins_lizard
    p1 = Player.new('a', @h1)
    p2 = Player.new('b', @h4)
    assert_equal @rules.check(p1, p2).winner, 'a'
  end

  def test_rock_wins_scissors
    p1 = Player.new('a', @h1)
    p2 = Player.new('b', @h3)
    assert_equal @rules.check(p1, p2).winner, 'a'
  end

  def test_paper_wins_rock
    p1 = Player.new('a', @h2)
    p2 = Player.new('b', @h1)
    assert_equal @rules.check(p1, p2).winner, 'a'
  end

  def test_paper_wins_spock
    p1 = Player.new('a', @h2)
    p2 = Player.new('b', @h5)
    assert_equal @rules.check(p1, p2).winner, 'a'
  end

  def scissors_wins_paper
    p1 = Player.new('a', @h3)
    p2 = Player.new('b', @h2)
    assert_equal @rules.check(p1, p2).winner, 'a'
  end

  def scissors_wins_lizard
    p1 = Player.new('a', @h3)
    p2 = Player.new('b', @h4)
    assert_equal @rules.check(p1, p2).winner, 'a'
  end

  def test_lizard_wins_paper
    p1 = Player.new('a', @h4)
    p2 = Player.new('b', @h2)
    assert_equal @rules.check(p1, p2).winner, 'a'
  end

  def test_lizard_wins_spock
    p1 = Player.new('a', @h4)
    p2 = Player.new('b', @h5)
    assert_equal @rules.check(p1, p2).winner, 'a'
  end

  def test_spock_wins_rock
    p1 = Player.new('a', @h5)
    p2 = Player.new('b', @h1)
    assert_equal @rules.check(p1, p2).winner, 'a'
  end

  def test_spock_wins_scissors
    p1 = Player.new('a', @h5)
    p2 = Player.new('b', @h3)
    assert_equal @rules.check(p1, p2).winner, 'a'
  end
end
