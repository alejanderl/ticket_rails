class Show < ActiveRecord::Base
  
  attr_accessible :content_related, :description, :name , :image_attributes, :image
  has_and_belongs_to_many :films
  has_many :events
  belongs_to :image
  accepts_nested_attributes_for :image
  
  def self.by_city(city)
   includes(:events => [{:room =>[{ :theater =>:address }] }]).where("events.date >= ?",Time.now)
  end

 def self.all_nested   
   includes(:events => [{:room =>[{ :theater =>:address }] }])
 end
 
  def self.by_city(city)
   includes(:events => [{:room =>[{ :theater =>:address }] }]).where("addresses.city = ? AND events.date >= ?",city,Time.now)
  end

  #shows = Show.includes(:events => [{:room =>[{ :theater =>:address }] }]).where("addresses.city = 'Barcelona'")Madrid

  

end
