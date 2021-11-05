# == Schema Information
#
# Table name: questions
#
#  id            :uuid             not null, primary key
#  question_type :integer          default(0)
#  title         :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  survey_id     :uuid             not null
#
# Indexes
#
#  index_questions_on_survey_id  (survey_id)
#
# Foreign Keys
#
#  fk_rails_...  (survey_id => surveys.id)
#
class Question < ApplicationRecord
  enum question_type: %i[text choice], _default: :text

  belongs_to :survey
  has_many :options, dependent: :destroy
  has_many :responses, dependent: :destroy

  def choices
    text? ? [] : options
  end
end
