class BodyTypesController < ApplicationController
  def new
    @body_type = BodyType.new
  end

  def create
    @body_type = BodyType.new(body_type_params)
    if @body_type.save
      redirect_to body_types_path
    else
      @body_types = BodyType.all
      render :index
    end
  end

  def index
    @body_types = BodyType.all
  end

  def update
    if @body_type.update(body_type_params)
      redirect_to body_types_path
    else
      render :index
    end
  end

  def destroy
    @body_type = BodyType.find(params[:id])
    @body_type.destroy
    redirect_to body_types_path
  end


  private

  def body_type_params
    params.require(:body_type).permit(:measurement_date, :height, :weight, :notes, :user_id)
  end
end
