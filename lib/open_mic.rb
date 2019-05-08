class OpenMic
  attr_reader :location, :date, :performers

  def initialize(info)
    @location = info[:location]
    @date = info[:date]
    @performers = []
    @repeated_jokes = false
    @joke_ids = Hash.new(nil)
  end

  def welcome(performer)
    @performers << performer
  end

  def repeated_jokes?
    return true if @repeated_jokes
    update_repeated_jokes
    @repeated_jokes
  end

  def update_repeated_jokes
    @performers.each do |performer|
      performer.jokes.each do |joke|
        if @joke_ids[joke.id] == nil
          @joke_ids[joke.id] = joke
          @repeated_jokes = false
        else
          @repeated_jokes = true
        end
      end
    end
  end
end
