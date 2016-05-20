class User < ApplicationRecord
  acts_as_url :name, limit: 64

  has_many :commitments, dependent: :destroy

  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates :uid, uniqueness: true, if: :uid?

  def to_s
    name
  end

  def to_param
    url
  end

  def self.active
    joins("LEFT OUTER JOIN commitments ON commitments.user_id = users.id")
      .group("users.id")
      .having("users.uid IS NOT NULL OR COUNT(commitments.id) > 0")
  end

  def self.alphabetically
    order(name: :asc)
  end
end
