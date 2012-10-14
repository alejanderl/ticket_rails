$(document).ready(function(){
  $("#event_date, #recurrence_end_date").datepicker();
  
  // this is for the list of sessions in rooms
  $("a[id^='is-ajax']").bind('ajax:success', function(evt, data, status, xhr){
    this2 = ($(this));
    replace_ID=this2.attr("update");
    $("#"+replace_ID).toggle("slow");
    $("#"+replace_ID).after(data);
    
   
  });
    $("a[id^='remove-serie']").bind('ajax:success', function(evt, data, status, xhr){
    this2 = ($(this));
    
    replace_ID=this2.attr("update");
    $("#"+replace_ID).toggle("slow");
    
    
   
  });
    
  $("#hide-serie").live("click",function(){
    
    belongs_to_serie = $(this).attr("data-serie");
   
    $("." + belongs_to_serie).remove();
      
      $("."+belongs_to_serie).remove();
      the_link = $(this);
      the_link.parent().parent().prev().toggle("slow")
      the_link.parent().parent().remove();
  })
    $('a[data-method="delete"]').live('ajax:success', function(){
      ($(this).parent().parent().toggle("slow"));
      }); 
  

    $("#recurrence_every").change(function () {
          var str = "";
          $("#recurrence_every option").each(function () {
            str = $(this).attr("value");
            
            $("#selector_"+str).css("display","none");
            $("#end_date").css("display","none");
          });
           str=$("#recurrence_every option:selected").attr("value")
          if (str!=""){
            $("#selector_" + str).toggle("fast");
            $("#end_date").css("display","block");
            }
        })
        .change();

  
  
});


 
 