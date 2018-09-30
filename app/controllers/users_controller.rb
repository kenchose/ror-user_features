class UsersController < ApplicationController
	def index
	end
	
	def new
	end

	def create
		@user = User.new( user_params )
		if @user.save
			session[:user_id] = @user.id
			redirect_to new_session_path
		else
			flash[:errors] = @user.errors.full_messages
			redirect_to new_user_path
		end
	end

	def show
		@user = User.find(session[:user_id])
	end

	private 
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end
end
