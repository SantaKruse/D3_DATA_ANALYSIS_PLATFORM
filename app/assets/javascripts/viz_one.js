$(document).ready(function() {

  $(document)
  .on('change', '.filter_checkbox, .year-box', function() {
    filterLists()
  })

   $(document)
  .on('click', '.btn', function() {
    filterLists()
  })



  function filterLists() {
    var form = $('#filter_form')
    console.log('hello ryan')
    $.ajax({
      url: form.attr('action'),
      type: 'post',
      data: form.serialize(),
      success: function(response) {
        $('#plot-item-container').html(response.html);
      }
    })
  }

  $(window).keydown(function(event){
    if(event.keyCode == 13) {
      event.preventDefault();
      return false;
    }
  });



})

