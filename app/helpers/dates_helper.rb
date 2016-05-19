module DatesHelper
  def dates(hackday)
    strip_leading_zeroes(hackday.start_date.strftime("%e")) +
      strip_leading_zeroes(hackday.end_date.strftime("–%e %B"))
  end

  private

  def strip_leading_zeroes(string)
    string.gsub(/\b0/, "")
  end
end
