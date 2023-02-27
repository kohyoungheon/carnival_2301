require "./lib/visitor"

RSpec.describe Visitor do
  before(:each) do
    @visitor1 = Visitor.new("Bruce", 54, '$10')
    @visitor1 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
  end

  describe "#initialize" do
    it "is an instance of Visitor" do
      expect(@visitor1).to be_an_instance_of(Visitor)
      expect(@visitor1.name).to eq('Bruce')
      expect(@visitor1.height).to eq(54)
      expect(@visitor1.spending_money).to eq('$10')
    end
  end

  describe "#add_preferences" do
    it "adds category preference to preferences"  do
      expect(@visitor1.preferences).to eq([])

      @visitor1.add_preference(:gentle)
      @visitor1.add_preference(:water)

      expect(@visitor1.preferences).to eq([:gentle, :water])
    end
  end
end