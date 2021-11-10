# Validates and creates a new Feedback instance with Responses
class FeedbackForm < Patterns::Form
  param_key 'feedback'

  attribute :survey_id, String
  attribute :responses, Array[Object]

  validates_presence_of :survey_id
  validates_presence_of :responses
  validate :survey_instance_must_exist
  validate :response_questions_must_exist

  attr_reader :feedback, :survey

  private

  def persist
    resource.survey = @survey
    @feedback = resource

    save_feedback_with_responses
  end

  def save_feedback_with_responses
    # Wrap all database transactions in a single transaction
    ActiveRecord::Base.transaction do
      resource.save!
      responses.each do |response|
        Response.create!(response.merge(feedback: resource))
      end
    end
  rescue ActiveRecord::StatementInvalid => e
    errors.add(:base, e.message)
    false
  end

  # Validations
  def survey_instance_must_exist
    @survey = Survey.find_by_id(@survey_id)
    @errors.add(:survey, 'does not exist') if @survey.nil?
  end

  def response_questions_must_exist
    responses.each do |response|
      # Check if question exists
      question = @survey.questions.find_by_id(response[:question_id])
      @errors.add(:responses, "question #{response[:question_id]} does not exist in survey") if question.nil?

      # Option check is only for choice-based questions
      next if question.nil? || !question.choice?

      question_option_must_exist(question, response[:option_id])
    end
  end

  def question_option_must_exist(question, option_id)
    return if question.options.where(id: option_id).exists?

    @errors.add(:responses, "option #{option_id} does not exist in question #{question.id}")
  end
end
