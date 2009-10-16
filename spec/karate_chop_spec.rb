require "spec"
require "karate_chop"

describe Chop do
  context "with an empty sorted array" do
    it "indicates item not found" do
      Chop.find(1, []).should == -1
    end
  end

  context "with search target not in array" do
    it "indicates item not found" do
      Chop.find(1, [0,2,3]).should == -1
    end
  end

  context "with search target in array" do
    it "provides the index of the located item when in the middle of the array" do
      Chop.find(1, [0,1,2,3]).should == 1
      Chop.find(4, [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]).should == 4
    end

    it "provides the index of the located item when it is last in the array" do
      Chop.find(20, [5, 10, 15, 20]).should == 3
    end

    it "provides the index of the located item when it is first in the array" do
      Chop.find(20, [20,40,60,80]).should == 0
    end
  end

  context "with a large array" do
    it "locates the item" do
      search_in = Array(0..900)
      Chop.find(100, search_in).should == 100
    end
  end
end