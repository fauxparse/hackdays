class Hackday < ApplicationRecord
  has_many :goals
  has_many :projects, through: :goals
  has_many :commitments, through: :goals

  before_validation :fill_in_dates

  validates :start_date, :end_date, presence: true
  validate :dates_in_order, :if => [:start_date?, :end_date?]

  def name
    start_date.strftime("Hackdays %B %Y")
  end

  def to_param
    start_date.strftime("%Y-%m")
  end

  def current?
    start_date <= Date.today && Date.today <= end_date
  end

  def self.current
    where("start_date <= :today AND end_date >= :today", today: Date.today)
      .first
  end

  def self.next
    where("start_date > ?", Date.today)
      .order(start_date: :asc)
      .first
  end

  private

  def dates_in_order
    errors.add(:end_date, "must be after start date") \
      unless end_date >= start_date
  end

  def fill_in_dates
    self.start_date ||= Date.today
    self.end_date ||= start_date + 1.day
  end
end
