require 'rails_helper'

RSpec.describe "people/index", type: :view do
  before(:each) do
    assign(:people, [
      Person.create!(
        :name => "Name",
        :email => "Email",
        :phone => "Phone",
        :mobile => "Mobile",
        :position_id => 2,
        :type => "Type"
      ),
      Person.create!(
        :name => "Name",
        :email => "Email",
        :phone => "Phone",
        :mobile => "Mobile",
        :position_id => 2,
        :type => "Type"
      )
    ])
  end

  it "renders a list of people" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Mobile".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
  end
end
