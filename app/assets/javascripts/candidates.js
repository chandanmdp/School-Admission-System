function manage(){
      $(".application-status select").change(function(){
        if ($(this).val() == "Appointment Rejected" || $(this).val() == "Application Rejected"){
          $('.rejection').show();
          $('.reject').show();
          $('.save').hide();
        }
        else {
          $('.rejection').hide();
          $('.reject').hide();
          $('.save').show();
        }
      });
      $(".admission-status select").change(function(){
        if ($(this).val() == "Appointment Rejected" || $(this).val() == "Application Rejected"){
          $('.rejection-reason').show();
          $('.grade').hide();
        }
        else {
          $('.rejection-reason').hide();
          $('.grade').show();
        }
      });
}
