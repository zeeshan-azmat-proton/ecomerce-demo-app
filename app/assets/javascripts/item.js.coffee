jQuery ->  
  $(document).on "click", ".add_item_button", (e) ->
    e.preventDefault()
    _this = this
    original_html = $(_this).html()
    console.log('before ajax')
    $.ajax
      type: "POST"
      url: $(_this).attr("href")
      success: (data) ->
        
      $('.add_item_button').html("Adding...").addClass('disabled')
      setTimeout (->
        $('#my_modal').modal("hide")
        return
      ), 1000
    return false

  



  $(".open_add_item_modal").on "click", (e) ->
    e.preventDefault()
    _this = this
    original_html = $(_this).html()
    $.ajax
      type: "get"
      url: "/items/" + $(_this).attr("id") + "/?ajax=1"
      success: (data) ->
        console.log(data)
        if data
          $('#my_modal').html(data).modal('show')
        else
          alert data.message
    return false
