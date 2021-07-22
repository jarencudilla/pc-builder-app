class AddVoltageColumnToRamTable < ActiveRecord::Migration[6.0]
  def change
    add_column :rams, :voltage, :string
  end
end
