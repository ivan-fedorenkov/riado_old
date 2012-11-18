class RegionsController < ApplicationController
  def set_current
    region = Region.find_by_name(params[:region].from_uri)
    if region
      @current_region = region
      session[:current_region] = region
      cookies[:current_region_id] = region.id
    else
      @current_region = Region.default
    end
    redirect_to root_path
  end

end
