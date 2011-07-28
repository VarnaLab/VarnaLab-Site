#= require jquery
#= require jquery_ujs

$ ->
  $(document).delegate '[data-action="remove"]', 'click', ->
    $(this).slideUp 'fast', -> $(this).remove()