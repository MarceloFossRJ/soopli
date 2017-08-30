require 'rails_helper'

RSpec.describe "contract_types/show", type: :view do
  before(:each) do
    @contract_type = assign(:contract_type, ContractType.create!(
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
