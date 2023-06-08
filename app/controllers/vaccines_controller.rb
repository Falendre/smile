class VaccinesController < ApplicationController
  before_action :set_vaccine, only: [:edit, :update, :destroy]
  
  def index
    @vaccines = Vaccine.all
  end

  def new
    @vaccine = Vaccine.new
  end

  def create
    @vaccine = Vaccine.new(vaccine_params)
    if @vaccine.save
      redirect_to vaccines_path
    else
      @vaccines = Vaccine.all
      render :index
    end
  end

  def edit
    @vaccine = Vaccine.find(params[:id])
  end

  def update
    @vaccine = Vaccine.find(params[:id])
    if @vaccine.update(vaccine_params)
      redirect_to vaccines_path
    else
      render :edit
    end
  end

  def destroy
    @vaccine = Vaccine.find(params[:id])
    @vaccine.destroy
    redirect_to vaccines_path
  end

  private

  def vaccine_params
    params.require(:vaccine).permit(:vaccine_name, :vaccination_date, :notes, :user_id)
  end

  def set_vaccine
    @vaccine = Vaccine.find(params[:id])
  end
end
  
  
  
  
  