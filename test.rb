class MatchingGame
  TIMES = 40
  LETTERS = %w(a a b b c c d d e e f f g g h h i i j j)

  def initialize
    @boxes = Hash[(1..LETTERS.size).zip(LETTERS.shuffle)]
    @tried = 0
  end

  def pickup index
  unless left?
    #puts "Games over, you running out of trials"
    #return false
    raise "Games over, you running out of trials"
  end
  if win?
    #puts "You've already won."
    #return false
    raise "You've already won."
  end

  if index == @previous_index
    #puts "not allowed"
    #return false
    raise "not allowed"
  end

  if @boxes[index].empty?
    #puts "That's number has been removed"
    raise "That's number has been removed"
  end

  puts "The box #{index} is #{@boxes[index]}"
  @tried += 1


  if @boxes[@previous_index] == @boxes[index]
    @boxes.reject { |_, value| value == @boxes[index]}
  end

  @previous_index = index

  puts "Congrats, you win!" if win?
  end

  private
  def left?
    @tried < TIMES
  end

  def win?
    @boxes.empty?
  end
end

require 'minitest/autorun'

class MatchingGameTest < Minitest::Test
  def test_game_over
    game1 = MatchingGame.new
    game1.instance_variable_set(:@tried, 40)
    #(1..40).each {
    #  game1.pickup(7)
    # }

    err = assert_raises RuntimeError {game1.pickup(15)}
    assert_match /Games over/, err.message
  end

  def test_win
    game1 = MatchingGame.new
    game1.instance_variable_set(:@boxes,{1=>'a', 2=>'a'})
    game1.pickup(1)

    err = assert_Raises RuntimeError {game1.pickup(2)}
    assert_match /Congrats/, err.message

  end

  def test_won
    game1 = MatchingGame.new
    game1.instance_variable_set(:@boxes,{})
    err = assert_Raises RuntimeError {game1.pickup(1)}
    assert_match /You've alread/, err.message
  end

  def test_trials_counted
    game1 = MatchingGame.new
    assert_equal(0, game1.instance_variable_get(:@tried))
    game1.pickup(5)
    assert_equal(1, game1.instance_variable_get(:@tried))

  end
end