require 'rails_helper'

RSpec.describe "customers/new", type: :view do
  before(:each) do
    assign(:customer, Customer.new(
      :name => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :company => nil
    ))
  end

  it "renders new customer form" do
    render

    assert_select "form[action=?][method=?]", customers_path, "post" do

      assert_select "input#customer_name[name=?]", "customer[name]"

      assert_select "input#customer_email[name=?]", "customer[email]"

      assert_select "input#customer_phone[name=?]", "customer[phone]"

      assert_select "input#customer_company_id[name=?]", "customer[company_id]"
    end
  end
end
