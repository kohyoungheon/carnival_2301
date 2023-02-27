require "./lib/visitor"

RSpec.describe Visitor do
  before(:each) do
    @visitor1 = Visitor.new("Bruce", 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
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

  describe "#tall_enough?" do
    it "returns boolean whether visitor is taller than given argument" do

      expect(@visitor1.tall_enough?(54)).to eq(true)
      expect(@visitor1.tall_enough?(55)).to eq(false)
      expect(@visitor2.tall_enough?(35)).to eq(true)
      expect(@visitor2.tall_enough?(38)).to eq(false)
    end
  end
end