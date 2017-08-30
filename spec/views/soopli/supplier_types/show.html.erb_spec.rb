require 'rails_helper'

RSpec.describe "supplier_types/show", type: :view do
  before(:each) do
    @supplier_type = assign(:supplier_type, SupplierType.create!(
      :name => "Name",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
