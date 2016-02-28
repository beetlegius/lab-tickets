class Subtask < ApplicationRecord
  belongs_to :task
  has_many :issues

  alias_attribute :to_s, :name
end
