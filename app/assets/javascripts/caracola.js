  $(document).ready(function(){
    $("#start_on, #recurrence_end_date").datepicker();
    
    // this is for the list of sessions in rooms
      $("a[id^='is-ajax']").bind('ajax:success', function(evt, data, status, xhr){
      this2 = ($(this));
      replace_ID=this2.attr("update");
       $("#"+replace_ID).toggle("slow");
      $("#"+replace_ID).parent().append(data);
      
  

  });
      $("#hide-serie").live("click",function(){
        
        belongs_to_serie = $(this).attr("data-serie");
       
        $("."+belongs_to_serie).remove();
          console.log($(this).parent().parent().prev());
          $("."+belongs_to_serie).remove();
          the_link = $(this);
           the_link.parent().parent().prev().toggle("slow")
          
            the_link.parent().parent().remove();
      })
      $('a[data-method="delete"]').live('ajax:success', function(){
        ($(this).parent().parent().toggle("slow"));
        }); 
    
  });
  
   
   