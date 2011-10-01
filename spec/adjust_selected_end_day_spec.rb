require 'spec_helper'

describe 'adjust_selected_end_day' do
  
  include PaginationHelper
  
  it "adjust other week correctly" do
    
    day = adjust_selected_end_day(10, 40)
    
    day.should == 12
    
  end
  
  it "adjust the present week correctly" do
    
    day = adjust_selected_end_day(37, 40)
    
    day.should == 40
    
  end
  
  
end