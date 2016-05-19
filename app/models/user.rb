class User < ApplicationRecord
  validates :name, :uid, :email, presence: true
  validates :uid, uniqueness: true

  def to_s
    name
  end
end
