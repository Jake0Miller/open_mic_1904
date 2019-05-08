require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'
require './lib/user'
require 'pry'

class UserTest < MiniTest::Test
  def setup
    @sal = User.new("Sal")
    @joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    @joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    @ali = User.new("Ali")
  end

  def test_it_exists
    assert_instance_of User, @sal
  end

  def test_attributes_start_as_defaults
    assert_equal "Sal", @sal.name
    assert_equal [], @sal.jokes
  end

  def test_it_learns_jokes
    @sal.learn(@joke_1)
    @sal.learn(@joke_2)

    assert_equal [@joke_1, @joke_2], @sal.jokes
  end

  def test_sal_tells_ali_jokes
    assert_equal [], @ali.jokes

    @sal.tell(@ali, @joke_1)

    assert_equal [@joke_1], @ali.jokes

    @sal.tell(@ali, @joke_2)

    assert_equal [@joke_1, @joke_2], @ali.jokes
  end
end
