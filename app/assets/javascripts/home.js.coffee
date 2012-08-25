Process =
  currentProcess: 0,
  maxProcesses: $('.process').size() - 1,

  init: ->
    $('i').hide()
    $('i').first().show()
    $('.process').hide()
    $('.process:eq(' + Process.currentProcess + ')').show()
    $('a#left').on 'click', @go_prev
    $('a#right').on 'click', @go_next
    $('a.step').on 'click', @gotostep

  go_prev: (e) ->
    e.preventDefault()
    if Process.currentProcess == 0
      Process.currentProcess = $(".process").size() - 1
    else
      Process.currentProcess--
    Process.show_process()

  go_next: (e) ->
    e.preventDefault()
    if Process.currentProcess == Process.maxProcesses
      Process.currentProcess = 0
    else
      Process.currentProcess++
    Process.show_process()

  show_process: ->
    $('.process').hide()
    $('.process:eq(' + Process.currentProcess + ')').fadeIn()
    $('i').hide()
    $("a[data-step-id='" + Process.currentProcess + "']").prev('i').show()

  gotostep: (e) ->
    e.preventDefault()
    Process.currentProcess = $(this).data('step-id')
    Process.show_process()

Galleries =
  currentImage: 0,
  maxImage: 0,

  init: ->
    $('ul.gallery').hide()
    $gallery = $('ul.gallery').first()
    $gallery.show()
    Galleries.currentImage = 0
    Galleries.maxImage = $gallery.find('.image').length
    $('a.gallery_title').on 'click', @show_current_gallery
    @slideImages($gallery)

  slideImages: (gallery) ->
    Galleries.myInterval = setInterval ->
      $('.image').hide()

      console.log('hey')

      if Galleries.currentImage < Galleries.maxImage
        console.log('h1')

        console.log gallery.find('.image:eq(' + Galleries.currentImage + ')')
        gallery.find('.image:eq(' + Galleries.currentImage + ')').show()
        Galleries.currentImage++
      else
        console.log('h2')

        Galleries.currentImage = 0
        gallery.find('.image:eq(' + Galleries.currentImage + ')').show()
    , 3000

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

GeorgeC =

  init: ->
    $('a.about').on 'click', @about_page
    $('a.processes').on 'click', @processes_page
    $('a.awards').on 'click', @awards_page
    $('a.galleries').on 'click', @galleries_page
    $('a.inventories').on 'click', @inventories_page
    $('a.contact').on 'click', @contact_page

  about_page: (e) ->
    GeorgeC.fancy_show()
    $("section#page").removeClass()
    $("section#page").addClass 'about'

  processes_page: (e) ->
    GeorgeC.fancy_show()
    $("section#page").removeClass()
    $("section#page").addClass 'processes'
    Process.init()

  awards_page: (e) ->
    GeorgeC.fancy_show()
    $("section#page").removeClass()
    $("section#page").addClass 'awards'

  galleries_page: (e) ->
    GeorgeC.fancy_show()
    $("section#page").removeClass()
    $("section#page").addClass 'galleries'
    Galleries.init()

  inventories_page: (e) ->
    GeorgeC.fancy_show()
    $("section#page").removeClass()
    $("section#page").addClass 'inventories'

  contact_page: (e) ->
    GeorgeC.fancy_show()
    $("section#page").removeClass()
    $("section#page").addClass 'contact'

  fancy_show: ->
    # $("section#page").animate({
    #   height: 0, opacity: 0.5
    # }, 500, "linear", ->
    #   $("section#page").animate({height: 500, opacity: 1}, 1000)
    # )
$ ->
  GeorgeC.init()
