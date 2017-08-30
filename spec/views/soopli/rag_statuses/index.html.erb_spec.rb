require 'rails_helper'

RSpec.describe "rag_statuses/index", type: :view do
  before(:each) do
    assign(:rag_statuses, [
      RagStatus.create!(
        :name => "Name"
      ),
      RagStatus.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of rag_statuses" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
