require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'
require 'pry'

class JokeTest < MiniTest::Test
  def setup
    @joke = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
  end

  def test_it_exists
    assert_instance_of Joke, @joke
  end

  def test_attributes
    assert_equal 1, @joke.id
    assert_equal "Why did the strawberry cross the road?", @joke.setup
    assert_equal "Because his mother was in a jam.", @joke.punchline
  end
end
