require 'rails_helper'

RSpec.describe "supplier_types/new", type: :view do
  before(:each) do
    assign(:supplier_type, SupplierType.new(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new supplier_type form" do
    render

    assert_select "form[action=?][method=?]", supplier_types_path, "post" do

      assert_select "input#supplier_type_name[name=?]", "supplier_type[name]"

      assert_select "textarea#supplier_type_description[name=?]", "supplier_type[description]"
    end
  end
end
