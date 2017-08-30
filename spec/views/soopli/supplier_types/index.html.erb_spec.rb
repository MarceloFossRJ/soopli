require 'rails_helper'

RSpec.describe "supplier_types/index", type: :view do
  before(:each) do
    assign(:supplier_types, [
      SupplierType.create!(
        :name => "Name",
        :description => "MyText"
      ),
      SupplierType.create!(
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of supplier_types" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
