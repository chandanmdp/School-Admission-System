function fee(){
  $(document).ready(function(){
    $("select#fee_section_id option").each(function(){
      if ($(this).text() == $('#section-name').text()){
        $(this).attr("selected", true)
      }
    });

    $('.table').each(function(){
      var total = 0;
      var $oneTime = $(this).find($('.one-time'));
      $oneTime.each(function(){
        if (parseInt($(this).text()) > 0 )
        {
          total = total + parseInt($(this).text());
        }
      })
    var $oneTimeTotal = $(this).find($('.one-time-total'));
        $oneTimeTotal.text(total)
    })
  });
}
