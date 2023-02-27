require "./lib/ride"
require "./lib/visitor"
require "./lib/carnival"

RSpec.describe Carnival do
  before(:each) do
    @carnival = Carnival.new("Denver Carnival")
  end

  describe "#initialize" do
    it "is an instance of Carnival" do
      expect(@carnival).to be_an_instance_of(Carnival)
    end
  end

end