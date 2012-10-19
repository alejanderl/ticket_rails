class Theater < ActiveRecord::Base
  attr_accessible :description, :name, :address_attributes, :image_attributes
  
  has_many :rooms , :dependent => :destroy
  has_one :address , :as => :addressable ,:dependent => :destroy
  belongs_to :image, :dependent => :destroy
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :image
  

  
  
end
