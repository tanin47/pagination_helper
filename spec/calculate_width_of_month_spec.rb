require 'spec_helper'

describe 'calculate_calculate_width_of_month' do
  
  include PaginationHelper
  
  it "calculate width of a month correctly" do
    
    m = PaginationMonth.new
    m.month = 4
    m.year = 2009
    
    calculate_width_of_month(m, 10, 100).should == 300
    
  end
  
  it "calculate width of February 2012 correctly" do
    
    m = PaginationMonth.new
    m.month = 2
    m.year = 2012
    
    calculate_width_of_month(m, 29, 100).should == 100
    
  end
  
  it "calculate width of February 2009 correctly" do
    
    m = PaginationMonth.new
    m.month = 2
    m.year = 2009
    
    calculate_width_of_month(m, 7, 100).should == 400
    
  end


end