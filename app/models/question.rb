class Question < ApplicationRecord
  enum type: [:text, :choice], _default: :text

  belongs_to :survey
  has_many :options
  has_many :responses
end
