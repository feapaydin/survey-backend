class Response < ApplicationRecord
  belongs_to :question
  belongs_to :option
  belongs_to :feedback
end
