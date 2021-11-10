module SurveyServices
  # Converts API request parameters into a valid format for Feedback Form
  class FeedbackCreator < ApplicationService
    @feedback_params = nil
    @survey_id = nil

    attr_reader :survey, :feedback, :errors

    def initialize(survey_id, feedback_params)
      super()
      @survey_id = survey_id
      @feedback_params = feedback_params
    end

    def call
      # Create feedback via form
      feedback_form = FeedbackForm.new(Feedback.new, form_params)

      if (form_saved = feedback_form.save)
        @feedback = feedback_form.feedback
        @survey = feedback_form.survey
      else
        @errors = feedback_form.errors.full_messages
      end

      form_saved
    end

    private

    def form_params
      {
        survey_id: @survey_id,
        responses: @feedback_params[:responses]
      }
    end
  end
end
