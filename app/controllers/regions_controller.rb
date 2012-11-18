class RegionsController < ApplicationController
  def set_current
    region = Region.find_by_code(params[:code])
    if region
      @current_region = region
      session[:current_region] = region
      cookies[:current_region_code] = region.code
    else
      @current_region = Region.default
    end
    redirect_to root_path
  end

end
