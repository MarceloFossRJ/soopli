class CreateSoopliTenants < ActiveRecord::Migration[5.0]
  def change
    create_table :soopli_tenants do |t|
      t.string :name
      t.string :subdomain

      t.timestamps
    end
  end
end
