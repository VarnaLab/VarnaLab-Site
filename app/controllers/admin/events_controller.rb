class Admin::EventsController < Admin::BaseController
	
	before_filter :authenticate_user!
  inherit_resources

  actions :show, :new, :create, :update, :edit, :destroy

	def index
	  @events = Event.all
	end

	def show
  	  @event = Event.find(params[:id])
	end
  def destroy
    destroy! :flash => !request.xhr?
  end
end
