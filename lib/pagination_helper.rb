# encoding: utf-8
module PaginationHelper
  
  # Arguments
  # selected_start_date => the start date of the selected block
  # days_per_block => The number of days per block
  # width_per_block => The width of a block
  # total_width => Total width of the container
  #
  # return data
  # :months => [ PaginationMonth ]
  # :units => [ PaginationUnit ]
  #
  def get_pagination_data(selected_start_date, days_per_block, width_per_block, total_width, options={})
    
    options[:padding_right] ||= 10
    options[:padding_left] ||= 10
  
  
  end
  
end
