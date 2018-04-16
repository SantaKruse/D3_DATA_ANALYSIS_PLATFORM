$(document).ready(function() {

  $(document)
  .on('change', '.filter_checkbox', function() {
    filterLists()
  })

  $(document)
  .on('click', '.btn', function() {
    filterLists()
  })

  filterLists()

  function filterLists() {
    var form = $('#filter_form')

    $.ajax({
      url: form.attr('action'),
      type: 'post',
      data: form.serialize(),
      dataType: 'json',
      success: function(response) {
        vizOne(response)
      }
    })
  }

  function vizOne(data){

  };

})

