require "spec"
require "karate_chop"

describe Chop do
  context "with an empty sorted array" do
    it "indicates item not found" do
      Chop.find(1, []).should == -1
    end
  end

  context "with search target in the middle of the array" do
    it "provides the index of the located item" do
      Chop.find(20, [5, 10, 20, 30, 50]).should == 2
    end
  end

  context "with search target as first item in the array" do
    it "provides an index of 0" do
      Chop.find(20, [20, 30, 40, 50, 60]).should == 0
    end
  end

  context "with search target as last item in the array" do
    it "provides an index for the last item" do
      Chop.find(20, [5, 10, 15, 20]).should == 3
    end
  end

  context "with search target not in the array" do
    it "indicates item not found" do
      Chop.find(20, [5, 15, 45, 135]).should == -1
    end
  end

  context "with a large array and a locatable search target" do
    it "provides the index of the found item" do
      large_array = Array(0..900)
      Chop.find(100, large_array).should == 100
    end
  end
end