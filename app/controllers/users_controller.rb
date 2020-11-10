class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to '/'
		else
			redirect_to '/users'
		end
	end

	private
		def user_params
			#binding.pry
		  	params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
			#params.permit(:firt_name, :last_name, :email, :password, :password_confirmation)
		end

end
