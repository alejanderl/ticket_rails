class Address < ActiveRecord::Base
  
  attr_accessible :city, :country, :line1, :line2, :postal_code
  belongs_to :addressable, :polymorphic => true
  

  
  
end
