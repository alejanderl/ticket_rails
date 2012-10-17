class Show < ActiveRecord::Base
  attr_accessible :content_related, :description, :name, :image_attributes
  has_and_belongs_to_many :films
  belongs_to :events
  belongs_to :image
end
