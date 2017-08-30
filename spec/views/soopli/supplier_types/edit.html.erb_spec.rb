require 'rails_helper'

RSpec.describe "supplier_types/edit", type: :view do
  before(:each) do
    @supplier_type = assign(:supplier_type, SupplierType.create!(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit supplier_type form" do
    render

    assert_select "form[action=?][method=?]", supplier_type_path(@supplier_type), "post" do

      assert_select "input#supplier_type_name[name=?]", "supplier_type[name]"

      assert_select "textarea#supplier_type_description[name=?]", "supplier_type[description]"
    end
  end
end
