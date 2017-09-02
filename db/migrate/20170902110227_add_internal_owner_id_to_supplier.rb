class AddInternalOwnerIdToSupplier < ActiveRecord::Migration[5.0]
  def change
    add_column :soopli_suppliers, :internal_owner_id, :integer
  end
end
