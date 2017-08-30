require 'rails_helper'

RSpec.describe "suppliers/show", type: :view do
  before(:each) do
    @supplier = assign(:supplier, Supplier.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Website/)
    expect(rendered).to match(/Twitter/)
    expect(rendered).to match(/Linkedin/)
    expect(rendered).to match(/Facebook/)
    expect(rendered).to match(/Github/)
    expect(rendered).to match(/Instagram/)
    expect(rendered).to match(/Registration Country/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
