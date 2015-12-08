class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def show
		@user = User.find params[:id]
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to root_path
		else
			render :new
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to root_path, notice: 'User was updated'
		else
			render :edit
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.delete
		redirect_to root_path, notice: 'User was deleted'
	end

	private

	def user_params
		params.require(:user).permit(:name, :password, :email)
	end
end