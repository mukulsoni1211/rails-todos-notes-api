class Todo < ApplicationRecord
  belongs_to :user

  enum status: [:pending, :completed]

  validates :status, inclusion: { in: statuses.keys }
end
