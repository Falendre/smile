class MedicationsController < ApplicationController
  def index
    @medications = Medication.all
  end

  def create
    medication = Medication.new(medication_params)
    if medication.save
      redirect_to medications_path
    else
      flash[:error] = "メディケーションの保存に失敗しました。"
      redirect_to medications_path
    end
  end

  private

  def medication_params
    params.require(:medication).permit(:image, :prescription_date)
  end
end
