# == Schema Information
#
# Table name: feedbacks
#
#  id         :uuid             not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  survey_id  :uuid             not null
#
# Indexes
#
#  index_feedbacks_on_survey_id  (survey_id)
#
# Foreign Keys
#
#  fk_rails_...  (survey_id => surveys.id)
#
class Feedback < ApplicationRecord
  belongs_to :survey
  has_many :responses, dependent: :destroy

  def as_json(opts = {})
    super(opts).merge(
      responses: responses.map(&:as_json)
    )
  end
end
