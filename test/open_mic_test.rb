require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'
require './lib/user'
require './lib/open_mic'
require 'pry'

class OpenMicTest < MiniTest::Test
  def setup
    @open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    @sal = User.new("Sal")
    @ali = User.new("Ali")
    @joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    @joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
  end

  def test_it_exists
    assert_instance_of OpenMic, @open_mic
  end

  def test_attributes
    assert_equal "Comedy Works", @open_mic.location
    assert_equal "11-20-18", @open_mic.date
    assert_equal [], @open_mic.performers
  end

  def test_adds_performers
    @open_mic.welcome(@sal)
    @open_mic.welcome(@ali)

    assert_equal [@sal, @ali], @open_mic.performers
  end

  def test_repeated_jokes
    @open_mic.welcome(@sal)
    @open_mic.welcome(@ali)
    @ali.learn(@joke_1)
    @ali.learn(@joke_2)

    refute @open_mic.repeated_jokes?

    @ali.tell(@sal, @joke_1)

    assert @open_mic.repeated_jokes?
  end
end
