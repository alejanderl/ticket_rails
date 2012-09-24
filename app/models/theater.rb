class Theater < ActiveRecord::Base
  attr_accessible :description, :name, :image, :address_attributes
  
  has_many :rooms , :dependent => :destroy
  has_one :address , :as => :addressable ,:dependent => :destroy
  
  accepts_nested_attributes_for :address
  mount_uploader :image, ImageUploader

  
  
end
