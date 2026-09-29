class ApplicationController < ActionController::Base
	before_action :authentication!
	skip_before_action :verify_authenticity_token

	def authentication!
		token = request.headers["Token"]
		render json: {error: "Token not present"} and return if token.nil?

		data = Jwt.decode(token)
		@user = User.find_by_email(data[0]['email'])

		render json: {error: "User not found"} and return if @user.nil?
	end

	def current_user
		@user
	end

end
