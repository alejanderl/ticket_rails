class Film < ActiveRecord::Base
  attr_accessible :description, :genre, :name
  has_many :sessions
end
