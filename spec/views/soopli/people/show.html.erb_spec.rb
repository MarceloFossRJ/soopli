require 'rails_helper'

RSpec.describe "people/show", type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(
      :name => "Name",
      :email => "Email",
      :phone => "Phone",
      :mobile => "Mobile",
      :position_id => 2,
      :type => "Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Mobile/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Type/)
  end
end
