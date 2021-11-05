class SurveyController < ApplicationController
  def show
    render_success Survey.find(params[:id])
  end

  def create
  end
end
