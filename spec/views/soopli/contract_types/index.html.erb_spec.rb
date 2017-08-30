require 'rails_helper'

RSpec.describe "contract_types/index", type: :view do
  before(:each) do
    assign(:contract_types, [
      ContractType.create!(
        :name => "Name",
        :description => "MyText"
      ),
      ContractType.create!(
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of contract_types" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
