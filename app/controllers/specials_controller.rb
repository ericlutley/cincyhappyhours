class SpecialsController < ApplicationController
  load_and_authorize_resource :place
  load_and_authorize_resource :through => :place, :except => :create

  def create
    @special = @place.specials.build(special_params)
    authorize! :create, @special

    if @special.save
      redirect_to @place
    else
      render 'new'
    end
  end

  def update
    if @special.update_attributes(special_params)
      redirect_to @place
    else
      render 'edit'
    end
  end

  def destroy
    @special.destroy!
    redirect_to @place
  end

  private

  def special_params
    params.require(:special).permit!
  end
end
