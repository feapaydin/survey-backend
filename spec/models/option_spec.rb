# == Schema Information
#
# Table name: options
#
#  id          :uuid             not null, primary key
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :uuid             not null
#
# Indexes
#
#  index_options_on_question_id  (question_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#
require 'rails_helper'

RSpec.describe Option, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
