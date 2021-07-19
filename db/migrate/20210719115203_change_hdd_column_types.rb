class ChangeHddColumnTypes < ActiveRecord::Migration[6.0]
  def change
    change_column :hdds, :cache, :string
  end
end
