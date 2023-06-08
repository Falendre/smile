class AllergiesController < ApplicationController

  def index
    @allergies = Allergy.all
    @allergy = Allergy.new
  end
  
  def edit
    @allergy = Allergy.find(params[:id])
  end
  
  def update
    def update
      @allergy = Allergy.find(params[:id])
      if @allergy.update(allergy_params)
        redirect_to allergies_path
      else
        @allergies = Allergy.all
        render :index
      end
    end
  end

  def create
    @allergy = current_user.allergies.build(allergy_params)
    if @allergy.save
      redirect_to allergies_path
    else
      @allergies = Allergy.all
      render :index
    end
  end
  
  def destroy
    @allergy = Allergy.find(params[:id])
    @allergy.destroy
    redirect_to allergies_path
  end
  
  private
  
  def allergy_params
    params.require(:allergy).permit(:kinds, :notes)
  end

end
