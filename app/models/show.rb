class Show < ActiveRecord::Base
  attr_accessible :content_related, :description, :name
  has_and_belongs_to_many :films
  belongs_to :events
end
