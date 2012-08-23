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


$ ->
  Process.init()

