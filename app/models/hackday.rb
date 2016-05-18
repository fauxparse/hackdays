class Hackday < ApplicationRecord
  validates :start_date, :end_date, presence: true
  validate :dates_in_order, :if => [:start_date?, :end_date?]

  private

  def dates_in_order
    errors.add(:end_date, "must be after start date") \
      unless end_date >= start_date
  end
end
