class AddInternalOwnerIdToCategory < ActiveRecord::Migration[5.0]
  def change
        add_column :soopli_categories, :internal_owner_id, :integer
  end
end
