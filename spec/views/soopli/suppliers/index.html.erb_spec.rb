require 'rails_helper'

RSpec.describe "suppliers/index", type: :view do
  before(:each) do
    assign(:suppliers, [
      Supplier.create!(
        :name => "Name",
        :website => "Website",
        :twitter => "Twitter",
        :linkedin => "Linkedin",
        :facebook => "Facebook",
        :github => "Github",
        :instagram => "Instagram",
        :registration_country => "Registration Country",
        :status_id => 2,
        :supplier_type_id => 3
      ),
      Supplier.create!(
        :name => "Name",
        :website => "Website",
        :twitter => "Twitter",
        :linkedin => "Linkedin",
        :facebook => "Facebook",
        :github => "Github",
        :instagram => "Instagram",
        :registration_country => "Registration Country",
        :status_id => 2,
        :supplier_type_id => 3
      )
    ])
  end

  it "renders a list of suppliers" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    assert_select "tr>td", :text => "Twitter".to_s, :count => 2
    assert_select "tr>td", :text => "Linkedin".to_s, :count => 2
    assert_select "tr>td", :text => "Facebook".to_s, :count => 2
    assert_select "tr>td", :text => "Github".to_s, :count => 2
    assert_select "tr>td", :text => "Instagram".to_s, :count => 2
    assert_select "tr>td", :text => "Registration Country".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
