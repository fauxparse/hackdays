class Like < ApplicationRecord
  belongs_to :goal, counter_cache: true
  belongs_to :user
end
