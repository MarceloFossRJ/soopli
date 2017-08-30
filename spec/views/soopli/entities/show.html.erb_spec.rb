require 'rails_helper'

RSpec.describe "entities/show", type: :view do
  before(:each) do
    @entity = assign(:entity, Entity.create!(
      :name => "Name",
      :status_id => 2,
      :registration_name => "Registration Name",
      :website => "Website",
      :twitter => "Twitter",
      :linkedin => "Linkedin",
      :finantial_year => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Registration Name/)
    expect(rendered).to match(/Website/)
    expect(rendered).to match(/Twitter/)
    expect(rendered).to match(/Linkedin/)
    expect(rendered).to match(/3/)
  end
end
