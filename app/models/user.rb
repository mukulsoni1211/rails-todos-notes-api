class User < ApplicationRecord
	has_secure_password

	has_many :todos, dependent: :destroy

	validates :status, inclusion: { in: statuses.keys }
end
