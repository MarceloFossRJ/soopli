class CreateSoopliEventTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :soopli_event_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
