class ChangeStoragesToHdds < ActiveRecord::Migration[6.0]
  def change
    rename_table :storages, :hdds
  end
end
