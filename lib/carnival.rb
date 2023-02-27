class Carnival
  attr_reader   :name, :duration
  attr_accessor :rides
  def initialize(name)
    @name = name
    @duration = 48
    @rides = []
  end

  def add_ride(ride)
    @rides << ride
  end

  def most_popular_ride
    @rides.each do |ride|
      ride.rider_log.each do |visitor, total_visits|
        ride.total_riders += total_visits
      end
    end

    @rides.max_by do |ride|
      ride.total_riders
    end
  end

  def most_profitable_ride
    
  end

end
