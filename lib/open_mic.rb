class OpenMic
  attr_reader :location, :date
  
  def initialize(info)
    @location = info[:location]
    @date = info[:date]
  end
end
