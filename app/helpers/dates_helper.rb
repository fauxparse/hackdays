module DatesHelper
  def dates(hackday, include_year = false)
    end_format = "–%e %B#{", %Y" if include_year}"
    date_without_leading_zeroes(hackday.start_date, "%e") +
      date_without_leading_zeroes(hackday.end_date, end_format)
  end

  private

  def date_without_leading_zeroes(date, format)
    date.strftime(format).gsub(/\b0/, "")
  end
end
