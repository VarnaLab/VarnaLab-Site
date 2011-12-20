class Admin::UsersController < Admin::BaseController

	before_filter :authenticate_user!

	actions :show, :new, :create, :update, :edit, :destroy

	def index
		puts "wwas here"
	  @users = User.all
	  super
	end

	def show
  	  @user = User.find(params[:id])
  	  super
	end
end 