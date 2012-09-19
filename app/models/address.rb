class Address < ActiveRecord::Base
  
  attr_accessible :city, :country, :line1, :line2, :postal_code
  belongs_to :addressable, :polymorphic => true
  
  #belongs_to :user
  #belongs_to:cinema
  #belongs to:theater
  
  
  
end
