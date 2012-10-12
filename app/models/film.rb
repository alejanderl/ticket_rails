class Film < ActiveRecord::Base
  attr_accessible :description, :genre, :name
  has_and_belongs_to_many :shows
  
end
