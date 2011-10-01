require 'spec_helper'

describe 'calculate_boundaries' do
  
  include PaginationHelper
  
  it "gives correct boundaries when the end day is the present day (odd number of block)" do
    
    start, ending = calculate_boundaries(93, 100, 5, 7)
    
    ending.should == 100
    start.should == 93 - 2 * 7
    
    ((ending - start) / 7 + 1).should == 4
    
  end
  
  
  it "gives correct boundaries when the end day is the present day (even number of block)" do
    
    start, ending = calculate_boundaries(93, 100, 6, 7)
    
    ending.should == 100
    start.should == 93 - 3 * 7
    
    ((ending - start) / 7 + 1).should == 5
    
  end
  
  
  it "gives correct boundaries when the end day is the present day (odd number of block)" do
    
    start, ending = calculate_boundaries(93, 107, 7, 7)
    
    ending.should == 107
    start.should == 93 - 3 * 7
    
    ((ending - start) / 7 + 1).should == 6
    
  end
  
  it "gives correct boundaries (odd number of blocks)" do
    
    start, ending = calculate_boundaries(93, 163, 5, 7)
    
    ending.should == 107
    start.should == 93 - 2 * 7
    
    ((ending - start) / 7 + 1).should == 5
    
  end
  

  it "gives correct boundaries (even number of blocks)" do
    
    start, ending = calculate_boundaries(93, 163, 6, 7)
    
    ending.should == 107
    start.should == 93 - 3 * 7
    
    ((ending - start) / 7 + 1).should == 6
    
  end

end