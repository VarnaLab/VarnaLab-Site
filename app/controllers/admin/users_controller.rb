class Admin::UsersController < Admin::BaseController

	before_filter :authenticate_user!
	inherit_resources

	actions :show, :new, :create, :update, :edit, :destroy

	def index
	  @users = User.all
	  super
	end

	def show
  	  @user = User.find(params[:id])
  	  super
	end
end 