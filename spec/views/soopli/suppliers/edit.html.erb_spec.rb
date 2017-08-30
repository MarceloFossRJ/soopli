require 'rails_helper'

RSpec.describe "suppliers/edit", type: :view do
  before(:each) do
    @supplier = assign(:supplier, Supplier.create!(
      :name => "MyString",
      :website => "MyString",
      :twitter => "MyString",
      :linkedin => "MyString",
      :facebook => "MyString",
      :github => "MyString",
      :instagram => "MyString",
      :registration_country => "MyString",
      :status_id => 1,
      :supplier_type_id => 1
    ))
  end

  it "renders the edit supplier form" do
    render

    assert_select "form[action=?][method=?]", supplier_path(@supplier), "post" do

      assert_select "input#supplier_name[name=?]", "supplier[name]"

      assert_select "input#supplier_website[name=?]", "supplier[website]"

      assert_select "input#supplier_twitter[name=?]", "supplier[twitter]"

      assert_select "input#supplier_linkedin[name=?]", "supplier[linkedin]"

      assert_select "input#supplier_facebook[name=?]", "supplier[facebook]"

      assert_select "input#supplier_github[name=?]", "supplier[github]"

      assert_select "input#supplier_instagram[name=?]", "supplier[instagram]"

      assert_select "input#supplier_registration_country[name=?]", "supplier[registration_country]"

      assert_select "input#supplier_status_id[name=?]", "supplier[status_id]"

      assert_select "input#supplier_supplier_type_id[name=?]", "supplier[supplier_type_id]"
    end
  end
end
