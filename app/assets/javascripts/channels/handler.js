
  function function_handler_start(data) {
    if ($.parseJSON(event.data)['message'] == data) {
      $('.ws label')
        .text(data)
        .css("color", "blue")
    }
  }

  function function_handler_done(data) {
    if ($.parseJSON(event.data)['message'] == data) {
      $('.ws label')
        .text(data)
        .css("color", "green")
    }
  }
