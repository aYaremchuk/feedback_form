include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :feedback do
    name { "#{Faker::Name.first_name} #{Faker::Name.last_name}" }
    birthday { Faker::Date.between(65.years.ago, 17.years.ago) }
    date_date { Faker::Date.between(Date.today + 1, Date.today + 1.year) }
    date_time { '10:00' }
    attachment { fixture_file_upload(Rails.root.join('spec/fixtures/files/file.doc'), 'application/msword') }
  end
end
