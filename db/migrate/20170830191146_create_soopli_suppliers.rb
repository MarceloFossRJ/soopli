class CreateSoopliSuppliers < ActiveRecord::Migration[5.0]
  def change
    create_table :soopli_suppliers do |t|
      t.string :name
      t.string :website
      t.string :twitter
      t.string :linkedin
      t.string :facebook
      t.string :github
      t.string :instagram
      t.string :registration_country
      t.date :finantial_year
      t.date :relation_started_at
      t.integer :status_id
      t.integer :supplier_type_id

      t.timestamps
    end
  end
end
