class Goal < ApplicationRecord
  belongs_to :hackday, inverse_of: :goals
  belongs_to :project, inverse_of: :goals

  validates :aim, presence: true
end
