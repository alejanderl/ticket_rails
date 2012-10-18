class Show < ActiveRecord::Base
  attr_accessible :content_related, :description, :name , :image_attributes, :image
  has_and_belongs_to_many :films
  has_many :events
  belongs_to :image
  accepts_nested_attributes_for :image
end
