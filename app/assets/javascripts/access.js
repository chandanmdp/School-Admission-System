function criteria(){
  $('.title-criteria').each(function(){
    var $that = $(this).find($('.eligibility-title'));
    var $that2 = $(this).find($('.criteria'));
    $that.click(function(){


      $that2.toggle()
    })
  })
}
