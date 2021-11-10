# Validates and creates a new Feedback instance with Responses
class FeedbackForm < Patterns::Form
  attribute :survey_id, String
  attribute :responses, Array[Object]

  validates_presence_of :survey_id
  validates_presence_of :responses
  validate :survey_instance_must_exist
  validate :response_questions_must_exist

  attr_reader :feedback, :survey

  private

  def persist
    create_feedback and create_responses
  end

  def create_feedback
    @feedback = Feedback.create(survey: @survey)
  end

  def create_responses
    responses.each do |response|
      response_instance = Response.new(response.merge(feedback: @feedback))

      if response_instance.valid?
        response_instance.save
      else
        errors.add(:response, response_instance.errors.full_messages)
      end
    end
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
