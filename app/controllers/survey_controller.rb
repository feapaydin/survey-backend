class SurveyController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound do
    render_not_found
  end

  def show
    render_success Survey.find(params[:id])
  end

  def create
  end
end
