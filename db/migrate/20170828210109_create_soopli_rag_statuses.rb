class CreateSoopliRagStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :soopli_rag_statuses do |t|
      t.string :name
      t.text :description
      t.integer :rag_statusable_id
      t.string :rag_statusable_type

      t.timestamps
    end
    add_index :soopli_rag_statuses, [:rag_statusable_id, :rag_statusable_type], name: 'soopli_rag_statuses_poly'
  end
end
