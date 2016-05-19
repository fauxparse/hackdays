require 'rails_helper'

RSpec.describe Hackday, type: :model do
  subject(:hackday) { FactoryGirl.create(:hackday) }

  context 'when dates are out of order' do
    subject do
      FactoryGirl.build(
        :hackday,
        start_date: "2016-05-19",
        end_date: "2016-05-18"
      )
    end

    it { is_expected.not_to be_valid }
  end
end
