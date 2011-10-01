require 'spec_helper'

describe 'generate_months' do
  
  include PaginationHelper
  
  it "generate months" do
    
    months = generate_months(to_days(Time.local(2002, 5, 7)), to_days(Time.local(2002, 8, 28)))
    
    months.length.should == 4
    
    months[0].month.should == 5
    months[0].year.should == 2002
    
    months[1].month.should == 6
    months[1].year.should == 2002
    
    months[2].month.should == 7
    months[2].year.should == 2002
    
    months[3].month.should == 8
    months[3].year.should == 2002
    
  end
  
  it "generate months over 2 years correctly" do
    
    months = generate_months(to_days(Time.local(2002, 10, 7)), to_days(Time.local(2003, 3, 28)))
    
    months.length.should == 6
    
    months[0].month.should == 10
    months[0].year.should == 2002
    
    months[1].month.should == 11
    months[1].year.should == 2002
    
    months[2].month.should == 12
    months[2].year.should == 2002
    
    months[3].month.should == 1
    months[3].year.should == 2003
    
    months[4].month.should == 2
    months[4].year.should == 2003
    
    months[5].month.should == 3
    months[5].year.should == 2003
    
  end

end