class RemoveTypeColumnFromSsdsTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :ssds, :type, :string
  end
end
