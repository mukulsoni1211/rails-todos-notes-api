class Todo < ApplicationRecord
  belongs_to :user

  enum status: [:pending, :completed]
  enum priority: [:low, :medium, :high]

  validates :status, inclusion: { in: statuses.keys }
end
