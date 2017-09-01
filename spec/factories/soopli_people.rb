FactoryGirl.define do
  factory :soopli_person, class: 'Soopli::Person' do
    name "MyString"
    email "MyString"
    phone "MyString"
    mobile "MyString"
    position_id 1
    type ""
  end
end
