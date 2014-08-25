class PlacesController < ApplicationController
  load_and_authorize_resource
  skip_load_and_authorize_resource :only => :create

  # GET /places
  def index
    @places = PlacesQuery.new(params).results

    if request.xhr?
      render partial: 'list', locals: { places: @places }
    else
      # Render index.html
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
    params.require(:place).permit!
  end
end
