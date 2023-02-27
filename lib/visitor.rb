class Visitor
  attr_reader   :name, :height
  attr_accessor :preferences, :spending_money

  def initialize(name,height,spending_money)
    @name = name
    @height = height
    @spending_money = spending_money.delete("$").to_i
    @preferences = []
  end

  def add_preference(ride_category)
    @preferences << ride_category
  end

  def tall_enough?(height_in_inches)
    @height >= height_in_inches
  end
end
