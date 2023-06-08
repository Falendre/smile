class UnderlyingConditionsController < ApplicationController
  def index
    @underlying_condition = UnderlyingCondition.all
  end
end
