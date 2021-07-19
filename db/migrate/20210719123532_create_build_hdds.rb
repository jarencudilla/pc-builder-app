class CreateBuildHdds < ActiveRecord::Migration[6.0]
  def change
    create_table :build_hdds do |t|

      t.timestamps
    end
  end
end
