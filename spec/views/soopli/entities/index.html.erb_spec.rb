require 'rails_helper'

RSpec.describe "entities/index", type: :view do
  before(:each) do
    assign(:entities, [
      Entity.create!(
        :name => "Name",
        :status_id => 2,
        :registration_name => "Registration Name",
        :website => "Website",
        :twitter => "Twitter",
        :linkedin => "Linkedin",
        :finantial_year => 3
      ),
      Entity.create!(
        :name => "Name",
        :status_id => 2,
        :registration_name => "Registration Name",
        :website => "Website",
        :twitter => "Twitter",
        :linkedin => "Linkedin",
        :finantial_year => 3
      )
    ])
  end

  it "renders a list of entities" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Registration Name".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    assert_select "tr>td", :text => "Twitter".to_s, :count => 2
    assert_select "tr>td", :text => "Linkedin".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
