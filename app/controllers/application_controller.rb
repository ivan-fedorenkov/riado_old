class ApplicationController < ActionController::Base
  before_filter :set_current_region
  
  protect_from_forgery

private
  def set_current_region
    if !(request.fullpath =~ /regions\/\d+\/set_current/)
      if session[:current_region]
        @current_region = session[:current_region]
      elsif
        @current_region = Region.find_by_code(cookies[:current_region_code])
      else
        @current_region = Region.default
      end
    end
  end
end
