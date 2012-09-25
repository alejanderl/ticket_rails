class Session < ActiveRecord::Base
  attr_accessible :date, :exception, :stall_available, :stall_reserve, :name
  
  belongs_to :film
  belongs_to :room
  
  
end
