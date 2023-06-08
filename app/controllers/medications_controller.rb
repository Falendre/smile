class MedicationsController < ApplicationController
  def index
    @medications = Medication.all
  end

  def create
    medication = Medication.new(medication_params)
    if medication.save
      redirect_to medications_path, notice: "手帳が保存されました。"
    else
      redirect_to medications_path, alert: "手帳の保存に失敗しました。"
    end
  end

  private

  def medication_params
    params.require(:medication).permit(:image, :prescription_date)
  end
end
