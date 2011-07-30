unless 'pushState' of window.history
  Pjax ->
else
  $.event.props.push('state') if $.event.props.indexOf('state') < 0

  class Pjax
    defaultTransition = (container, content) ->
      @container.html(content)

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
          @goto(url, push: false)

    on: (selector) ->
      @container.delegate selector, 'click', (e) =>
        return true if event.which > 1 or event.metaKey
        e.preventDefault()
        element = $(e.target)
        @goto element.attr('href'), push: true, transition: element.data('transition')

    goto: (href, options) ->
      transition = @findTransition(options and options.transition)
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
          transition @container, response
          document.title = $.trim(@container.find('title').remove().text()) or document.title
          window.history.pushState({pjax: true, url: href}, document.title, href) if options.push
          @container.trigger 'pjax:after'

    findTransition: (type) ->
      if type is 'none'
        defaultTransition
      else if type is 'slide-left'
        slideLeft
      else
        slideRight


  slide = (direction, container, newContent) ->
    width = container.width()
    wrap = $('<div />').width(width * 2)

    wrapper1 = $('<div style="overflow: hidden; float: left">').width(width).html(container.html())
    wrapper2 = $('<div style="overflow: hidden; float: left">').width(width).html(newContent)

    container.html('');
    container.append(wrap);

    if direction is 'left'
      wrapper2.appendTo(wrap)
      wrapper1.appendTo(wrap)
      wrap.css('marginLeft', "-#{width}px").animate {marginLeft: "0px"}, -> container.html(newContent)
    else
      wrapper1.appendTo(wrap)
      wrapper2.appendTo(wrap)
      wrap.animate {marginLeft: "-#{width}px"}, -> container.html(newContent)

  slideLeft = (container, content) -> slide('left', container, content)
  slideRight = (container, content) -> slide('right', container, content)

window.Pjax = Pjax