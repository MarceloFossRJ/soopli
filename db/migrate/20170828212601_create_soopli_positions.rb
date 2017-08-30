class CreateSoopliPositions < ActiveRecord::Migration[5.0]
  def change
    create_table :soopli_positions do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
