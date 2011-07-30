class Admin::BaseController < ApplicationController
  layout :determine_layout

  private

  def determine_layout
    if request.xhr?
      'admin_pjax'
    else
      'admin'
    end
  end
end