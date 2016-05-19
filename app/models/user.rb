class User < ApplicationRecord
  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates :uid, uniqueness: true, if: :uid?

  def to_s
    name
  end
end
