require "./lib/ride"

RSpec.describe Ride do
  before(:each) do
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    @visitor1 = Visitor.new("Bruce", 54, '$10')
    @visitor2 = Visitor.new('Tucker', 10, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
  end

  describe "#initialize" do
    it "is an instance of Ride" do
      expect(@ride1).to be_an_instance_of(Ride)
      expect(@ride1.name).to eq('Carousel')
      expect(@ride1.min_height).to eq(24)
      expect(@ride1.admission_fee).to eq(1)
      expect(@ride1.excitement).to eq(:gentle)
    end
  end

  describe "#board_rider" do
    it "allows boarding if tall enough and excitement matches" do
      @visitor2.add_preference(:gentle)
      expect(@ride1.board_rider(@visitor2)).to eq("You cannot ride.")

      expect(@ride1.board_rider(@visitor1)).to eq("You cannot ride.")
      @visitor1.add_preference(:gentle)
      expect(@ride1.board_rider(@visitor1)).to eq({@visitor1=>1})
    end

    it "reduces visitor spending money and increments total revenue" do
      expect(@visitor1.spending_money).to eq(10)
      expect(@ride1.total_revenue).to eq(0)

      @visitor1.add_preference(:gentle)
      @ride1.board_rider(@visitor1)

      expect(@visitor1.spending_money).to eq(9)
      expect(@ride1.total_revenue).to eq(1)

      @ride1.board_rider(@visitor1)

      expect(@visitor1.spending_money).to eq(8)
      expect(@ride1.total_revenue).to eq(2)

      @ride2.board_rider(@visitor1)
      expect(@visitor1.spending_money).to eq(3)
      expect(@ride2.total_revenue).to eq(5)

      @visitor3.add_preference(:gentle)
      expect(@visitor3.spending_money).to eq(15)

      @ride2.board_rider(@visitor3)
      expect(@visitor3.spending_money).to eq(10)
      expect(@ride2.total_revenue).to eq(10)
    end

    it "tracks riders in log" do
      @visitor1.add_preference(:gentle)
      @visitor1.add_preference(:medium)
      @visitor3.add_preference(:gentle)
      @visitor3.add_preference(:medium)

      expect(@ride1.rider_log).to eq({})

      @ride1.board_rider(@visitor1)
      expect(@ride1.rider_log).to eq({@visitor1=>1})

      @ride1.board_rider(@visitor3)
      expect(@ride1.rider_log).to eq({@visitor1 => 1, @visitor3 => 1})

      @ride1.board_rider(@visitor1)
      expect(@ride1.rider_log).to eq({@visitor1 => 2, @visitor3 => 1})

      @ride2.board_rider(@visitor3)
      expect(@ride2.rider_log).to eq({@visitor3=>1})

      @ride2.board_rider(@visitor3)
      @ride2.board_rider(@visitor1)
      expect(@ride2.rider_log).to eq({@visitor3 => 2, @visitor1 => 1})
    end
  end
end