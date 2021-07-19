class CreateBuildHdds < ActiveRecord::Migration[6.0]
  def change
    create_table :build_hdds do |t|
      t.references :build, null: false, foreign_key: true
      t.references :hdd, null: false, foreign_key: true

      t.timestamps
    end
  end
end
