require 'rails_helper'

RSpec.describe "people/edit", type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(
      :name => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :mobile => "MyString",
      :position_id => 1,
      :type => ""
    ))
  end

  it "renders the edit person form" do
    render

    assert_select "form[action=?][method=?]", person_path(@person), "post" do

      assert_select "input#person_name[name=?]", "person[name]"

      assert_select "input#person_email[name=?]", "person[email]"

      assert_select "input#person_phone[name=?]", "person[phone]"

      assert_select "input#person_mobile[name=?]", "person[mobile]"

      assert_select "input#person_position_id[name=?]", "person[position_id]"

      assert_select "input#person_type[name=?]", "person[type]"
    end
  end
end
