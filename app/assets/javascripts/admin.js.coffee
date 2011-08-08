#= require jquery
#= require jquery_ujs
#= require_tree ./lib

$ ->
  RemoteEvents.start(document)

  $(document).delegate '[data-action="remove"]', 'click', ->
    $(this).slideUp 'fast', -> $(this).remove()

  $(document).delegate 'li', 'remote:destroy', ->
    $(this).remove()
