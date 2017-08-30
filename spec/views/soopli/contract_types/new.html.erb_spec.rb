require 'rails_helper'

RSpec.describe "contract_types/new", type: :view do
  before(:each) do
    assign(:contract_type, ContractType.new(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new contract_type form" do
    render

    assert_select "form[action=?][method=?]", contract_types_path, "post" do

      assert_select "input#contract_type_name[name=?]", "contract_type[name]"

      assert_select "textarea#contract_type_description[name=?]", "contract_type[description]"
    end
  end
end
