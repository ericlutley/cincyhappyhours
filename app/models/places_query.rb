class PlacesQuery
  def initialize(params)
    @location = params[:address] if params[:address].present?
    @location = @location.split(",") if /^-?\d+\.\d+,-?\d+\.\d+$/ === @location

    @open_only = params[:open_only].present?
    @page = params[:page]
  end

  def results
    places = Place.includes(:specials).where("specials.id IS NOT NULL")

    if @location
      places = places.near(@location, 20)
    end

    places = places.order(:name)

    if @open_only
      places = places.select { |p| p.specials.any? { |s| s.available_now? } }
    end

    places
  end
end
