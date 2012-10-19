class Image < ActiveRecord::Base
  attr_accessible :alt_text, :file, :name
  has_many :events
  has_many  :shows
  has_many  :theaters
  mount_uploader :file, ImageUploader
end
