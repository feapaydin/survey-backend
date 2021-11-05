# == Schema Information
#
# Table name: surveys
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Survey < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :feedbacks, dependent: :destroy

  def as_json(opts = {})
    super(opts).merge(
      questions: questions.map(&:as_json),
      feedbacks: feedbacks.map(&:as_json)
    )
  end
end
