require 'spec_helper'

describe 'label_page' do
  
  include PaginationHelper
  
  it "labels page correctly" do
    
    units = []
    
    10.times { units.push(PaginationUnit.new) }
    
    units[5].is_selected = true
    
    label_page(45, units)
    
    units[0].page = 50
    units[9].page = 41
    
  end


end