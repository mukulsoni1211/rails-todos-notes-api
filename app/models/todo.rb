class Todo < ApplicationRecord
  belongs_to :user

  enum :status, {
    pending: "pending",
    completed: "completed"
  }
end
