class RemoveRamsModuleAndQuantity < ActiveRecord::Migration[6.0]
  def change
    remove_column :rams, :module, :string
    remove_column :rams, :quantity, :integer
  end
end
