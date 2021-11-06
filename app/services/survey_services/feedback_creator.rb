module SurveyServices
  class FeedbackCreator < ApplicationService
    attr_reader :survey_id, :feedback_params, :survey, :feedback, :error

    def initialize(survey_id, feedback_params)
      @survey_id = survey_id
      @feedback_params = feedback_params
    end

    def call
      find_survey || (return false)

      # TODO: Create feedback via form
      @feedback = { id: 1 }

      true
    end

    private

    def find_survey
      @survey = Survey.find_by_id(@survey_id)
      !@survey.nil?
    end
  end
end
