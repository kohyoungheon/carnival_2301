require "./lib/ride"
require "./lib/visitor"
require "./lib/carnival"

RSpec.describe Carnival do
  before(:each) do
    @carnival = Carnival.new("Denver Carnival")

    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })

    @visitor1 = Visitor.new("Bruce", 54, '$100')
    @visitor2 = Visitor.new('Tucker', 10, '$50')
    @visitor3 = Visitor.new('Penny', 64, '$150')

    @visitor1.add_preference(:gentle)
    @visitor2.add_preference(:gentle)
    @visitor3.add_preference(:gentle)

    @visitor1.add_preference(:thrilling)
    @visitor3.add_preference(:thrilling)
  end

  describe "#initialize" do
    it "is an instance of Carnival" do
      expect(@carnival).to be_an_instance_of(Carnival)
      expect(@carnival.name).to eq("Denver Carnival")
      expect(@carnival.duration).to eq(48)
      expect(@carnival.rides).to eq([])
    end
  end

  describe '#add_ride' do
    it "adds a ride to a carnival's rides" do
      expect(@carnival.rides).to eq([])

      @carnival.add_ride(@ride1)
      expect(@carnival.rides).to eq([@ride1])

      @carnival.add_ride(@ride2)
      expect(@carnival.rides).to eq([@ride1, @ride2])

      @carnival.add_ride(@ride3)
      expect(@carnival.rides).to eq([@ride1, @ride2, @ride3])
    end
  end

  describe "#most_popular_ride" do
    it "returns most popular ride at the carnival" do
      @carnival.add_ride(@ride1)
      @carnival.add_ride(@ride2)
      @carnival.add_ride(@ride3)

      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor3)

      @ride2.board_rider(@visitor1)
      @ride2.board_rider(@visitor3)
      @ride2.board_rider(@visitor1)
      
     expect(@carnival.most_popular_ride).to eq(@ride2)
    end
  end
end