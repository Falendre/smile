class BodyTypesController < ApplicationController
  def new
    @body_type = BodyType.new
  end

  def create
    @body_type = BodyType.new(body_type_params)
    if @body_type.save
      redirect_to body_types_path, notice: '身長体重データを保存しました。'
    else
      render :new
    end
  end

  def index
    @body_types = BodyType.all
  end

  private

  def body_type_params
    params.require(:body_type).permit(:measurement_date, :height, :weight, :notes)
  end
end
