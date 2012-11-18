class ApplicationController < ActionController::Base
  before_filter :set_current_region
  
  protect_from_forgery

private
  def set_current_region
    if !(request.fullpath =~ /regions\/\d+\/set_current/)
      if session[:current_region]
        @current_region = session[:current_region]
      elsif cookies[:current_region_id]
        @current_region = Region.find(cookies[:current_region_id])
      else
        @current_region = Region.default
      end
    end
  end
end
