Inventories =

  init: ->
    $('.image').hide().first().show()
    $(".image_thumb").on 'click', @show_main_picture

  show_main_picture: ->
    image_id = $(this).data('image-id')
    $('.image').hide()
    $('.image[data-image-id="' + image_id + '"]').show();

$ ->
  if window.location.pathname.match(/\/inventories\/\d+/)
    Inventories.init()

