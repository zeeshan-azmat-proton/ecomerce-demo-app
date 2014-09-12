jQuery ->  
  $(".add_item_button").on "click", (e) ->
    e.preventDefault()
    _this = this
    original_html = $(_this).html()
    $.ajax
      type: "POST"
      url: $(_this).attr("href")
      # beforeSend: ->
      #   $(_this).html($(_this).html() + get_ajax_loader_html())
      success: (data) ->
        if data.status == "success"
          # $(_this).parents(".modal").modal("hide")
          # $(_this).parents("tr").hide()
        else
          $(_this).html(original_html)
          alert data.message
    return false