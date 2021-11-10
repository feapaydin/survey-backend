# Controller actions for /survey requests
class SurveyController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound do
    render_not_found
  end

  def show
    render_success Survey.find(params[:id])
  end

  def create
    service = SurveyServices::FeedbackCreator.call(params[:id], feedback_params)

    if service.result
      render_success feedback: service.feedback
    else
      render_bad_request service.error
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(responses: %i[question_id option_id body])
  end
end
