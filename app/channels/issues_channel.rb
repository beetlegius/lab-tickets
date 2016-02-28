# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class IssuesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "issues_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # def create(data)
  #   Issue.create! name: data['name'], subtask_id: data['subtask_id']
  # end
end
