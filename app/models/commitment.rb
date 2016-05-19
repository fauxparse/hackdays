class Commitment < ApplicationRecord
  belongs_to :user
  belongs_to :goal

  has_one :hackday, through: :goal
  has_one :project, through: :goal

  delegate :current?, to: :hackday
end
