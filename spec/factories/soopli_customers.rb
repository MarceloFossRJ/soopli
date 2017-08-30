FactoryGirl.define do
  factory :soopli_customer, class: 'Soopli::Customer' do
    name "MyString"
    email "MyString"
    phone "MyString"
    company nil
  end
end
