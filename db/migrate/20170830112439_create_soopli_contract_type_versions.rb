class CreateSoopliContractTypeVersions < ActiveRecord::Migration[5.0]
  TEXT_BYTES = 1_073_741_823
    
  def change
    create_table :soopli_contract_type_versions do |t|
      t.string   :item_type, {:null=>false}
      t.integer  :item_id,   null: false
      t.string   :event,     null: false
      t.string   :whodunnit
      t.text     :object, limit: TEXT_BYTES
      t.text     :object_changes
      t.datetime :created_at
    end
    add_index :soopli_contract_type_versions, %i(item_type item_id)
    
    Soopli::ContractType.create(name: 'MSA', description: 'Master service agreement', id: 1)
    Soopli::ContractType.create(name: 'NDA', description: 'Non-disclosure agreement', id: 2)
    Soopli::ContractType.create(name: 'SoW', description: 'Statement of work', id: 3)
    Soopli::ContractType.create(name: 'Schedule', description: '', id: 4)
    
  end
end
