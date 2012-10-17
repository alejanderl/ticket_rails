class Image < ActiveRecord::Base
  attr_accessible :alt_text, :file, :name
  has_many :events
  has_many  :shows
  mount_uploader :file, ImageUploader
end
