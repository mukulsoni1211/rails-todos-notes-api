class SessionController < ApplicationController
	skip_before_action :authentication!

	def login
		user = User.find_by(email: params[:email])
		render json: {error: "email not exist." } and return if user.nil?

		render json: {error: "Wrong password" } and return unless user.authenticate(params[:password])

		token = Jwt.encode({email: user.email})

		render json: {token: token, name: user.name, email: user.email}
	end
end
