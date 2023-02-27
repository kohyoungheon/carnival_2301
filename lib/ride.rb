class Ride
  attr_reader :name, :min_height, :admission_fee, :excitement
  attr_accessor :total_revenue

  def initialize(info_hash)
    @name = info_hash[:name]
    @min_height = info_hash[:min_height]
    @admission_fee = info_hash[:admission_fee]
    @excitement = info_hash[:excitement]
    @total_revenue = 0
  end
 
end
