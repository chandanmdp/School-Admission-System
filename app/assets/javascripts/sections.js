function addGrades(){
  var grades_array = ['Kindergarten', '1st', '2nd', '3rd', '4th', '5th', '6th', '7th', '8th', '9th', '10th', '11th', '12th'];
  var section_grades_array = [];
  $('#added-grades').html("");
  var min = $('#starting-grade').val();
  var max = $('#ending-grade').val();
  min_index = grades_array.indexOf(min)
  max_index = grades_array.indexOf(max)
  if(min_index > max_index)
  {
    alert("Ending grade can't be lower than starting grade");
  }
  else {
    section_grades_array = grades_array.slice(min_index, max_index+1)
    $('#added-grades').append('<b>Grades Added</b>:  ' + section_grades_array)
    $('.section_grades').val(section_grades_array.join())
  }
}

function editSection(){
  $(document).ready(function(){
    $("select#starting-grade option").each(function(){
      if ($(this).text() == $('#min-grade').text()){
        $(this).attr("selected", true)
      }
    });
      $("select#ending-grade option").each(function(){
        if ($(this).text() == $('#max-grade').text()){
          $(this).attr("selected", true)
        }
    });
  });
}
