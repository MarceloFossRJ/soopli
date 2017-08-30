class CreateSoopliSupplierTypeVersions < ActiveRecord::Migration[5.0]
  TEXT_BYTES = 1_073_741_823
    
  def change
    create_table :soopli_supplier_type_versions do |t|
      t.string   :item_type, {:null=>false}
      t.integer  :item_id,   null: false
      t.string   :event,     null: false
      t.string   :whodunnit
      t.text     :object, limit: TEXT_BYTES
      t.text     :object_changes
      t.datetime :created_at
    end
    add_index :soopli_supplier_type_versions, %i(item_type item_id)
  end
end
