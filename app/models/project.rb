class Project < ApplicationRecord
  acts_as_url :title,
    only_when_blank: true,
    limit: 64

  validates :url, format: { with: /\A[a-z0-9\-]+\z/ }

  def to_param
    url
  end
end
