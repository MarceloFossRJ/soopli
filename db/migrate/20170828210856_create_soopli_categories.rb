class CreateSoopliCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :soopli_categories do |t|
      t.string :name
      t.integer :status_id

      t.timestamps
    end
  end
end
