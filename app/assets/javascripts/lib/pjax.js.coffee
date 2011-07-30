unless 'pushState' of window.history
  Pjax ->
else
  $.event.props.push('state') if $.event.props.indexOf('state') < 0

  class Pjax
    constructor: (container) ->
      @container = $(container)
      window.history.replaceState({pajax: false, url:null}, document.title)
      setTimeout(@onpopstate, 1)

    onpopstate: =>
      $(window).bind 'popstate', (e) =>
        state = e.state
        url = state.url or location.href
        unless state.pjax
          window.location = url
        else
          @goto(url, false)

    on: (selector) ->
      @container.delegate selector, 'click', (e) =>
        return true if event.which > 1 or event.metaKey
        e.preventDefault()
        @goto $(e.target).attr('href')

    goto: (href, push = true) ->
      $.ajax
        url: href,
        data: { _pjax: true},
        type: 'GET',
        dataType: 'html',
        beforeSend: (xhr) =>
          @container.trigger 'pjax:before'
          xhr.setRequestHeader('X-PJAX', 'true')
        error: ->
          window.location.href = href
        success: (response) =>
          @container.html response
          document.title = $.trim(@container.find('title').remove().text()) or document.title
          window.history.pushState({pjax: true, url: href}, document.title, href) if push
          @container.trigger 'pjax:after'

window.Pjax = Pjax