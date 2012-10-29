class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|
     flash[:notice] = "Access denied!"
     redirect_to :back
   end
   
    Fields_list = Struct.new(:name , :image , :description , :date, :url, :title)
     include Rails.application.routes.url_helpers
     
     
      
  def theme_variables(arg)
     list = Array.new
     arg.each do |t|
       
       process_data =  Fields_list.new(:name , :image , :description , :date, :url)     
       process_data.title = t.class.name
       process_data.name = t.name
       process_data.image = t.image.file_url(:thumb_150) if (["Event","Theater","Show"].include? t.class.name )
       process_data.description = t.description if (["Show"].include? t.class.name )
       process_data.date = t.date if (["Event"].include? t.class.name )
       process_data.url =  eval("Rails.application.routes.url_helpers.#{t.class.name.downcase}_path(#{t.id})")
       list << process_data
       
     end
    
    list
  end
   
end
