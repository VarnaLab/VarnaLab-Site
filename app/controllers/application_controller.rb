class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  private

  def record_not_found
    render 'shared/_record_not_found', :layout => 'application', :status => 404
  end
end
