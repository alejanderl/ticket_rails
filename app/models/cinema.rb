class Cinema < ActiveRecord::Base
  attr_accessible :description, :name
   has_one:address, dependent: :destroy
   accepts_nested_attributes_for :address
   #validations
   validates :name,  :presence => true  
end
