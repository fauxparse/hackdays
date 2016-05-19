class Project < ApplicationRecord
  acts_as_url :name,
    only_when_blank: true,
    limit: 64

  has_many :goals, inverse_of: :project, autosave: true, dependent: :destroy

  validates :name, :description, presence: true
  validates :url, format: { with: /\A[a-z0-9\-]+\z/ }, if: :name?

  def to_s
    name
  end

  def to_param
    url
  end

  def contributors
    goals.flat_map(&:users).uniq
  end
end
