class AddInternalOwnerIdToEntity < ActiveRecord::Migration[5.0]
  def change
        add_column :soopli_entities, :internal_owner_id, :integer
  end
end
