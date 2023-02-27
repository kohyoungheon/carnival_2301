class Ride
  attr_reader   :name, :min_height, :admission_fee, :excitement
  attr_accessor :total_revenue, :rider_log

  def initialize(info_hash)
    @name = info_hash[:name]
    @min_height = info_hash[:min_height]
    @admission_fee = info_hash[:admission_fee]
    @excitement = info_hash[:excitement]
    @total_revenue = 0
    @rider_log = Hash.new(0)
  end
 
  def board_rider(visitor)
    if visitor.tall_enough?(@min_height) && visitor.preferences.include?(@excitement)
      visitor.spending_money -= @admission_fee
      @total_revenue += @admission_fee
      @rider_log[visitor] += 1
      @rider_log
    else
      return "You cannot ride."
    end
  end
end
