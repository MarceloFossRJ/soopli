require 'rails_helper'

RSpec.describe "rag_statuses/show", type: :view do
  before(:each) do
    @rag_status = assign(:rag_status, RagStatus.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
