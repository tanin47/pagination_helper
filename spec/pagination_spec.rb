require 'spec_helper'

module PaginationRspecHelper
  
  def validate_month_data(start_day, end_day, months) 
    
    month = start_day.month
    year = start_day.year
    
    i = 0
    while true
    
      months[i].month.should == month
      months[i].year.should == year
      
      break if end_day.month == month and end_day.year == year
      
      i += 1
      month += 1
      
      if month == 13
        month = 1
        year += 1
      end
      
    end
    
  end
  
  
  def validate_unit_data(start_date, end_date, units, days_per_block) 
    
    start_day = (start_date.to_i / 86400).to_i
    
    (start_day + ((units.length-1)*days_per_block)).should == (end_date.to_i / 86400).to_i
    
  end
  
end

describe 'pagination' do
  
  include PaginationRspecHelper
  include PaginationHelper
  
  it "generates latest correctly" do
    
    present = Time.local(2011, 9, 5)
    selected_day = present
    
    Time.stub!(:now).and_return(present)
    
    page_data = get_pagination_data(selected_day, 1, 7, 10, 107)
    
    validate_month_data(selected_day - 6 * 7 * 86400, present, page_data.months) 
    validate_unit_data(selected_day - 5 * 7 * 86400, present, page_data.units, 7) 
    
    page_data.units[5].is_selected.should == true
    
    page_data.units[5].page.should == 1
    page_data.units[0].page.should == 6
    
  end
  
  
  it "generates correctly, even the two-weeks-ago block is selected" do
    
    present = Time.local(2011, 9, 5)
    selected_day = present - 14 * 86400
    
    Time.stub!(:now).and_return(present)
    
    page_data = get_pagination_data(selected_day, 3, 7, 10, 107)
    
    validate_month_data(selected_day - 6 * 7 * 86400, present, page_data.months) 
    validate_unit_data(selected_day - 5 * 7 * 86400, present, page_data.units, 7) 
    
    page_data.units[5].is_selected.should == true
    
    page_data.units[5].page.should == 3
    page_data.units[7].page.should == 1
    
    page_data.units[0].page.should == 8
    
  end
  
  it "adjusts automatically if the selected day is not valid" do
    
    present = Time.local(2011, 9, 5)
    selected_day = present - 1 * 86400
    
    Time.stub!(:now).and_return(present)
    
    page_data = get_pagination_data(selected_day, 1, 7, 10, 107)
    
    validate_month_data(selected_day + 1 * 86400 - 6 * 7 * 86400, present, page_data.months) 
    validate_unit_data(selected_day + 1 * 86400 - 5 * 7 * 86400, present, page_data.units, 7) 
    
    page_data.units[5].is_selected.should == true
    
    page_data.units[5].page.should == 1
    page_data.units[0].page.should == 6
    
  end

  it "centers correctly" do
    
    selected_day = Time.local(2009, 12, 5)
    present = selected_day + 500 * 86400
    
    Time.stub!(:now).and_return(present)
    
    page_data = get_pagination_data(selected_day, 100, 7, 10, 107)
    
    validate_month_data(selected_day - 6 * 7 * 86400, selected_day + 4 * 7 * 86400, page_data.months) 
    validate_unit_data(selected_day - 5 * 7 * 86400, selected_day + 4 * 7 * 86400, page_data.units, 7) 
    
    page_data.units[5].is_selected.should == true
    
    page_data.units[5].page.should == 100
    
    page_data.units[0].page.should == 105
    page_data.units[9].page.should == 96
    
  end

end