# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(->
  $('#footer').css('bottom', (20 - $('#footer').height()) + 'px')

  $(document).on('click', '#footer-arrow.operator-hide', ->
    $('#footer').animate({'bottom':'0px'}, 600)
    $('#footer-arrow').removeClass("operator-hide")
    $('#footer-arrow').addClass("operator-show")
    return false
  )
  $(document).on('click', '#footer-arrow.operator-show', ->
    $('#footer').animate({'bottom':(20 - $('#footer').height()) + 'px'}, 600)
    $('#footer-arrow').removeClass("operator-show")
    $('#footer-arrow').addClass("operator-hide")
    return false
  )
)
