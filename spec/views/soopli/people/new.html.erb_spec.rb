require 'rails_helper'

RSpec.describe "people/new", type: :view do
  before(:each) do
    assign(:person, Person.new(
      :name => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :mobile => "MyString",
      :position_id => 1,
      :type => ""
    ))
  end

  it "renders new person form" do
    render

    assert_select "form[action=?][method=?]", people_path, "post" do

      assert_select "input#person_name[name=?]", "person[name]"

      assert_select "input#person_email[name=?]", "person[email]"

      assert_select "input#person_phone[name=?]", "person[phone]"

      assert_select "input#person_mobile[name=?]", "person[mobile]"

      assert_select "input#person_position_id[name=?]", "person[position_id]"

      assert_select "input#person_type[name=?]", "person[type]"
    end
  end
end
