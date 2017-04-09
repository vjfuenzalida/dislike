class UsersController < ApplicationController
before_action :get_user, only: [:show]

	def show
	end

	

private

	def get_user
		if user_signed_in?
			@user = current_user
		end
	end

end
