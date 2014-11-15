class FacebookPlacesController < ApplicationController
  # before_filter :authenticate!
  # respond_to :html

  def index
    @facebook_places = FacebookPlaces.search(params[:name], params[:location])
    render layout: nil
  end
end
