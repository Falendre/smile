class VaccinesController < ApplicationController
  def index
    @vaccines = Vaccine.all
  end

  def new
    @vaccine = Vaccine.new
  end

  def create
    @vaccine = Vaccine.new(vaccine_params)
    if @vaccine.save
      redirect_to vaccines_path, notice: "ワクチンが作成されました。"
    else
      render :new
    end
  end

  def edit
    @vaccine = Vaccine.find(params[:id])
  end

  def update
    @vaccine = Vaccine.find(params[:id])
    if @vaccine.update(vaccine_params)
      redirect_to vaccines_path, notice: "ワクチンが更新されました。"
    else
      render :edit
    end
  end

  def destroy
    @vaccine = Vaccine.find(params[:id])
    @vaccine.destroy
    redirect_to vaccines_path, notice: "ワクチンが削除されました。"
  end

  private

  def vaccine_params
    params.require(:vaccine).permit(:vaccine_name, :vaccination_date, :notes)
  end
end
  
  
  
  
  