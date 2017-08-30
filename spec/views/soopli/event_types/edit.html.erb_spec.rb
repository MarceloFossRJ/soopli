require 'rails_helper'

RSpec.describe "event_types/edit", type: :view do
  before(:each) do
    @event_type = assign(:event_type, EventType.create!(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit event_type form" do
    render

    assert_select "form[action=?][method=?]", event_type_path(@event_type), "post" do

      assert_select "input#event_type_name[name=?]", "event_type[name]"

      assert_select "textarea#event_type_description[name=?]", "event_type[description]"
    end
  end
end
