class AddTdpColumnToGpuTable < ActiveRecord::Migration[6.0]
  def change
    add_column :gpus, :tdp, :string
  end
end
