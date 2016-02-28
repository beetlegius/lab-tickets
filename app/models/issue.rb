class Issue < ApplicationRecord

  STATUSES = [PENDING = 'pending', DOING = 'doing', CLOSED = 'closed']

  attr_accessor :request_ip

  after_initialize :set_status

  after_create_commit { IssueBroadcastJob.perform_later self, 'create' }
  after_update_commit { IssueBroadcastJob.perform_later self, 'update' }
  after_destroy { IssueBroadcastJob.perform_later self, 'delete' }

  validates :name, :status, presence: true
  validates :status, inclusion: { in: STATUSES }

  belongs_to :subtask

  def change_status!(a_status)
    update! status: a_status
  end

  def label
    case status
    when PENDING then 'warning'
    when DOING then 'info'
    when CLOSED then 'success'
    end
  end

  private

  def set_status
    self.status ||= PENDING
  end

end
