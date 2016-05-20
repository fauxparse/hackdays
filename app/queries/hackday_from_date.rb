class HackdayFromDate
  attr_reader :date

  def initialize(date)
    @date = date
  end

  def hackday
    @hackday ||= @date && scope(@date).first!
  end


  def self.from_param(id)
    return new(nil) unless id.present?
    year, month = id.split("-").map(&:to_i)
    new(Date.new(year, month, 1))
  end

  private

  def scope(date)
    Hackday
      .includes(:goals => [:hackday, :users, :likes])
      .where("start_date >= ? AND start_date < ?", date, date + 1.month)
  end
end
