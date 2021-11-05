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
require 'rails_helper'

RSpec.describe Question, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
