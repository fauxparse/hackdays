FactoryGirl.define do
  factory :hackday do
    start_date Date.new(2016, 5, 19)
    end_date { start_date + 1.day }
  end
end
