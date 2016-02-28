class IssueBroadcastJob < ApplicationJob
  queue_as :default

  def perform(issue, action)
    ActionCable.server.broadcast 'issues_channel', id: issue.id, action: action, issue: render_issue(issue), message: render_message(issue, action)
  end

  private

  def render_issue(issue)
    ApplicationController.renderer.render(issue)
  end

  def render_message(issue, action)
    message = case action
    when 'create' then "The issue '#{issue.name}' was created"
    when 'update' then "The issue '#{issue.name}' was updated"
    when 'delete' then "The issue '#{issue.name}' is gone"
    end
    ApplicationController.renderer.render(partial: 'notice', locals: { message: message })
  end
end
