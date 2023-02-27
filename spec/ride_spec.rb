require "./lib/ride"

RSpec.describe Ride do
  before(:each) do
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
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
end