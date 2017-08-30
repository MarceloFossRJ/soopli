class CreateSoopliEntities < ActiveRecord::Migration[5.0]
  def change
    create_table :soopli_entities do |t|
      t.string :name
      t.integer :status_id
      t.string :registration_name
      t.string :website
      t.string :twitter
      t.string :linkedin
      t.date :finantial_year
      

      t.timestamps
    end
  
  end
end
