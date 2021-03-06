class Event < ActiveRecord::Base
  
  attr_accessible :date, :event_duration ,:exception, :name, :stall_total, :show_id, :image_attributes
  
  
  
  validates_presence_of :room_id 
  validates_date :date , :after => (Time.now - 2.day)
  validates :name, :length => { :minimum => 2 }  
  validates_numericality_of :event_duration , :greater_than => 0
  
  RECURRENCE = [["Daily","daily"],["Weekly","weekly"],["Monthly","monthly"]]
 
  DAILY_RECURRENCE=[["1 Day",1],["2 Days",2],["3 Days",3],["4 Days",4],["5 Days",5],["6 Days",6],["7 Days",7]]
  
  WEEKLY_RECURRENCE=[["Monday",1],["Tuesday",2],["Wednesday",3],["Thursday",4],["Friday",5],["Saturday",6],["Sunday",7]]

  MONTHLY_RECURRENCE=[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]
  
  after_validation :calculate_end_date

  belongs_to :room
  belongs_to :show
  belongs_to :image
  before_save :default_image
  
  accepts_nested_attributes_for :image
  
  scope :uniq_list , :select => ("DISTINCT ON (serie_id) *")
  
  def check_overriding
    
    concurrent = Event.first(:conditions =>["date > ? AND end_date < ?", self.date,self.date])
    raise "Another value exists" if concurrent.present?
    
  end
  
  def duration
    (self.end_date-self.date)
  end
  
  def is_serie
    
    if self.serie_id == 0
       return false
    else
      
      true
    end
    
  end
  
  private
  
  def calculate_end_date    
    self.end_date = self.date + self.event_duration.hours
  end

  def default_image
    
     if self.show_id != 0 
       show = Show.find(self.show_id)
       self.build_image
       self.image_id = show.image_id
       
     end
  end


  
end
