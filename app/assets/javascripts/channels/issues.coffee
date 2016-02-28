App.issues = App.cable.subscriptions.create "IssuesChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    issue_tr = $("#issue_" + data['id'])
    switch data['action']
      when 'delete'
        issue_tr.remove()
      when 'update'
        issue_tr.replaceWith data['issue']
      when 'create'
        $("#issues tbody").append data['issue']
    $("#flash").html data['message']

  # create: (name, subtask_id) ->
  #   @perform 'create', name: name, subtask_id: subtask_id
