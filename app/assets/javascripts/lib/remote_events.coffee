window.RemoteEvents =
  events:
    post:   'submit',
    put:    'submit',
    delete: 'destroy'
  errors:
    422: 'validationError',
    404: 'notFound'
  start: (root) ->
    $.ajaxPrefilter (options, originalOptions, xhr) ->
      xhr.method = options.type.toLowerCase()
      null
    $(root).bind
      'ajax:success': (e, data, status, xhr) =>
        $(e.target).trigger 'remote:' + eventName, [data, status, xhr] if eventName = @events[xhr.method]
      'ajax:error': (e, xhr) =>
        $(e.target).trigger 'remote:' + errorName, [xhr.responseText, xhr.status, xhr] if eventName = @errors[xhr.status]