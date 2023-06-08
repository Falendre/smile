class UnderlyingConditionsController < ApplicationController
  before_action :set_underlying_condition, only: [:edit, :update, :destroy]

  def index
    @underlying_conditions = UnderlyingCondition.all
  end

  def create
    @underlying_condition = UnderlyingCondition.new(underlying_condition_params)

    if @underlying_condition.save
      redirect_to underlying_conditions_path
    else
      render :index
    end
  end

  def edit
  end

  def update
    if @underlying_condition.update(underlying_condition_params)
      redirect_to underlying_conditions_path
    else
      render :edit
    end
  end

  def destroy
    @underlying_condition.destroy
    redirect_to underlying_conditions_path
  end

  private

  def set_underlying_condition
    @underlying_condition = UnderlyingCondition.find(params[:id])
  end

  def underlying_condition_params
    params.require(:underlying_condition).permit(:details, :diagnosis_date, :notes).merge(user_id: current_user.id)
  end
end
