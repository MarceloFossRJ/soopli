require 'rails_helper'

RSpec.describe "entities/new", type: :view do
  before(:each) do
    assign(:entity, Entity.new(
      :name => "MyString",
      :status_id => 1,
      :registration_name => "MyString",
      :website => "MyString",
      :twitter => "MyString",
      :linkedin => "MyString",
      :finantial_year => 1
    ))
  end

  it "renders new entity form" do
    render

    assert_select "form[action=?][method=?]", entities_path, "post" do

      assert_select "input#entity_name[name=?]", "entity[name]"

      assert_select "input#entity_status_id[name=?]", "entity[status_id]"

      assert_select "input#entity_registration_name[name=?]", "entity[registration_name]"

      assert_select "input#entity_website[name=?]", "entity[website]"

      assert_select "input#entity_twitter[name=?]", "entity[twitter]"

      assert_select "input#entity_linkedin[name=?]", "entity[linkedin]"

      assert_select "input#entity_finantial_year[name=?]", "entity[finantial_year]"
    end
  end
end
