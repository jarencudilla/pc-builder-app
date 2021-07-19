class CreateHdds < ActiveRecord::Migration[6.0]
  def change
    create_table :hdds do |t|

      t.timestamps
    end
  end
end
