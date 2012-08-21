class Film < ActiveRecord::Base
  attr_accessible :description, :genre, :name
end
