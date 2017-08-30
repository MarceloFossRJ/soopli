require 'rails_helper'

RSpec.describe "rag_statuses/edit", type: :view do
  before(:each) do
    @rag_status = assign(:rag_status, RagStatus.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit rag_status form" do
    render

    assert_select "form[action=?][method=?]", rag_status_path(@rag_status), "post" do

      assert_select "input#rag_status_name[name=?]", "rag_status[name]"
    end
  end
end
