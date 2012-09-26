class Room < ActiveRecord::Base
  attr_accessible  :description, :name, :repetition_rule, :stall_total, :start_on ,:finish_on
  attr_accessor :extra_values
  
  has_many :sessions
  belongs_to :theater
  


end