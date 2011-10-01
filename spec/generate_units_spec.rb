require 'spec_helper'

describe 'generate_units' do
  
  include PaginationHelper
  
  it "generate units when the end is the present day" do
    
    units = generate_units(7, 49, 28, 49, 7)
    
    units.length.should == 7
    
    units[3].is_selected = true
    units[6].is_present == true
    
  end
  
  it "generate units when the end is NOT the present day" do
    
    units = generate_units(7, 49, 14, 56, 7)
    
    units.length.should == 7
    
    units[2].is_selected = true
    units[6].is_present == false
    
  end

end