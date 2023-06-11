class MedicationsController < ApplicationController
  def index
    @medications = Medication.all
  end

  def create
    medication = Medication.new(medication_params)
    if medication.save
      redirect_to medications_path
    else
      redirect_to medications_path
    end
  end

  def destroy
    @medication = Medication.find(params[:id])
    @medication.destroy
    redirect_to medications_path
  end

  private

  def medication_params
    params.require(:medication).permit(:image, :prescription_date, :user_id)
  end
end
