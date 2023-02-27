class Carnival
  attr_reader   :name, :duration
  attr_accessor :ride
  def initialize(name)
    @name = name
    @duration = 0
    @ride = []
  end
end
