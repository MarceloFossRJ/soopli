require 'rails_helper'

RSpec.describe "rag_statuses/new", type: :view do
  before(:each) do
    assign(:rag_status, RagStatus.new(
      :name => "MyString"
    ))
  end

  it "renders new rag_status form" do
    render

    assert_select "form[action=?][method=?]", rag_statuses_path, "post" do

      assert_select "input#rag_status_name[name=?]", "rag_status[name]"
    end
  end
end
