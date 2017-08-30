class CreateSoopliPeople < ActiveRecord::Migration[5.0]
  def change
    create_table :soopli_people do |t|
      t.string :name
      t.string :email
      t.integer :position_id
      t.string :type

      t.timestamps
    end
  end
end
