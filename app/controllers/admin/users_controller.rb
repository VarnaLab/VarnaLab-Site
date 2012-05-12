class Admin::UsersController < Admin::BaseController

	before_filter :authenticate_user!
	inherit_resources

	actions :show, :new, :create, :update, :edit, :destroy

	def index
	  @users = User.all
	end

	def show
  	  @user = User.find(params[:id])
	end
end 