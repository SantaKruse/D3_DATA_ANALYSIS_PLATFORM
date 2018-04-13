$(document).ready(function() {

  $(document)
  .on('change', '.filter_checkbox', function() {
    filterLists()
  })

  function filterLists() {
    var form = $('#filter_form')

    $.ajax({
      url: form.attr('action'),
      type: 'post',
      data: form.serialize(),
      success: function(response) {
        $('#plot-item-container').html(response.html);
      }
    })
  }


})