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
    @body_types = BodyType.order(measurement_date: :desc).limit(5)
  end
  def more
    @body_types = BodyType.order(measurement_date: :desc).offset(5).limit(5)
    respond_to do |format|
      format.js { render layout: false }
    end
  end

  def show
    head :no_content
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
