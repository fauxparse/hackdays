class Goal < ApplicationRecord
  belongs_to :hackday, inverse_of: :goals
  belongs_to :project, inverse_of: :goals
  has_many :commitments, inverse_of: :goal, dependent: :destroy
  has_many :users, through: :commitments

  validates :aim, presence: true
end
