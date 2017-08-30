class CreateSoopliStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :soopli_statuses do |t|
      t.string :name

      t.timestamps
    end
    
    Soopli::Status.create(name: 'Pipeline', id: 1)
    Soopli::Status.create(name: 'Active', id: 2)
    Soopli::Status.create(name: 'Archived', id: 3)
  end
end
