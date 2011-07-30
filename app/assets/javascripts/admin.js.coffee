#= require jquery
#= require jquery_ujs
#= require lib/pjax

$ ->
  new Pjax('article').on('a:not([data-action]):not([data-remote]):not([data-method]):not([data-pjax="skip"])')

  $(document).bind 'pjax:before', -> $('.notice').remove()

  $(document).delegate '[data-action="remove"]', 'click', ->
    $(this).slideUp 'fast', -> $(this).remove()
