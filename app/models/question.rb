# == Schema Information
#
# Table name: questions
#
#  id         :uuid             not null, primary key
#  title      :string           not null
#  type       :integer          default("text")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  survey_id  :uuid             not null
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
  enum type: [:text, :choice], _default: :text

  belongs_to :survey
  has_many :options
  has_many :responses
end
