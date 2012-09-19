class Cinema < ActiveRecord::Base
  attr_accessible :description, :name , :photo, :address_attributes, :image, :remote_image_url
   has_one :address, :dependent=> :destroy
   accepts_nested_attributes_for :address
   #validations
   validates :name,  :presence => true
   has_attached_file :photo , :styles => {:small => "150x150#", :large => "500x500>"}
   
   mount_uploader :image, ImageUploader
   
   after_update :reprocess_photo
   private
   def reprocess_photo
     #photo.reprocess!
   end
end
