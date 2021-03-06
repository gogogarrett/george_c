Galleries =
  currentImage: 0,
  maxImage: 0,

  init: ->
    $('ul.gallery').hide()
    $('.image').hide()
    $gallery = $('ul.gallery').first()
    $gallery.show()
    Galleries.currentImage = 0
    Galleries.maxImage = $gallery.find('.image').length
    $('a.gallery_title').on 'click', @show_current_gallery
    @slideImages($gallery)

  slideImages: (gallery) ->
    Galleries.myInterval = setInterval ->
      $('.image').hide()

      if Galleries.currentImage < Galleries.maxImage
        gallery.find('.image:eq(' + Galleries.currentImage + ')').fadeIn('slow')
        Galleries.currentImage++
      else
        Galleries.currentImage = 0
        gallery.find('.image:eq(' + Galleries.currentImage + ')').fadeIn('slow')
    , 3500

  show_current_gallery: (e) ->
    e.preventDefault()
    title = $(this).data('title');

    $('ul.gallery').hide()
    $gallery = $('ul.'+title).show()
    $('.image').hide()
    $gallery.find('.image').first().show()

    window.clearInterval(Galleries.myInterval);
    Galleries.currentImage = 0
    Galleries.maxImage = $gallery.find('.image').length
    Galleries.showArrow($gallery)
    Galleries.slideImages($gallery)

  showArrow: (gallery) ->
    $('i.arrow').hide()
    $('a[data-title="' + gallery.data('title') + '"]').prev('i.arrow').show()

$ ->
  if window.location.pathname.match(/\/galleries/)
    Galleries.init()
