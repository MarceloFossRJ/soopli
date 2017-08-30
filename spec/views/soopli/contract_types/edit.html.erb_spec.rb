require 'rails_helper'

RSpec.describe "contract_types/edit", type: :view do
  before(:each) do
    @contract_type = assign(:contract_type, ContractType.create!(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit contract_type form" do
    render

    assert_select "form[action=?][method=?]", contract_type_path(@contract_type), "post" do

      assert_select "input#contract_type_name[name=?]", "contract_type[name]"

      assert_select "textarea#contract_type_description[name=?]", "contract_type[description]"
    end
  end
end
