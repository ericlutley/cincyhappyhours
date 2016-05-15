class PlacesController < ApplicationController
  load_and_authorize_resource
  skip_load_and_authorize_resource only: [:new, :create]
  before_filter :redirect_if_exists, only: [:new, :create]

  # GET /places
  def index
    @places = PlacesQuery.new(params).results

    if request.xhr?
      render partial: 'list', locals: { places: @places }
    else
      # Render index.html
    end
  end

  def new
    @place = Place.new(place_params)
    authorize! :create, @place

    if @place.external_id.present?
      flash.notice = "#{@place.name} is not in our database, but you can add it below."
    end
  end

  # POST /places
  def create
    @place = Place.new(place_params)
    authorize! :create, @place

    if @place.save
      redirect_to @place, notice: 'Place was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /places/1
  def update
    if @place.update_attributes(place_params)
      redirect_to @place, notice: 'Place was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /places/1
  def destroy
    @place.destroy
    redirect_to places_url
  end

  private

  def place_params
    params.require(:place).permit(:name, :address, :latitude, :longitude, :external_id)
  end

  def redirect_if_exists
    # Ensure we have a place hash
    params[:place] ||= { name: nil }

    external_id = params[:place][:external_id]
    if external_id.present?
      place = Place.with_external_id(external_id).first
      redirect_to place_path(place) if place
    end
  end
end
