class ChangeHddTypeToRpm < ActiveRecord::Migration[6.0]
  def change
    rename_column :hdds, :type, :rpm
  end
end
