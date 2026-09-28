class RegistrationController < ApplicationController
	skip_before_action :authentication!

	def signup
		user = User.find_by(email: params[:email])
		render json: {error: "email already exist." } and return if user.present?

		user = User.create(user_params)

		token = Jwt.encode({email: user.email})

		render json: {token: token, name: user.name, email: user.email}
	end

	private
	def user_params
		params.permit(:name, :email, :password, :password_confirmation)
	end
end
