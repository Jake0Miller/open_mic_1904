class User
  attr_reader :name

  def initialize(name)
    @name = name
    @jokes = {}
  end

  def jokes
    @jokes.values
  end

  def learn(joke)
    @jokes[joke.id] = joke
  end

  def tell(user, joke)
    user.learn(joke)
  end

  def joke_by_id(id)
    @jokes[id]
  end
end
