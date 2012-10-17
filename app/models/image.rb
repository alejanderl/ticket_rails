class Image < ActiveRecord::Base
  attr_accessible :alt_text, :file, :name
  has_many :events
  mount_uploader :file, ImageUploader
end
