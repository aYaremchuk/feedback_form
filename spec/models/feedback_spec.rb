require 'rails_helper'

describe Feedback do
  let(:feedback) { FactoryGirl.create(:feedback) }

  it 'valid' do
    expect(feedback).to be_valid
  end
end
