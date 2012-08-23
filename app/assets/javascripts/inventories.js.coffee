Inventories =

  init: ->
    $('.image').hide()
    $('.image').first().show()
    $(".image_thumb").on 'click', @show_main_picture

  show_main_picture: ->
    image_id = $(this).data('image-id')
    $('.image').hide()
    $('.image[data-image-id="' + image_id + '"]').show();

$ ->
  Inventories.init()

