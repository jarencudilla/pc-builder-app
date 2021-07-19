class CreateBuildSsds < ActiveRecord::Migration[6.0]
  def change
    create_table :build_ssds do |t|
      t.references :build, null: false, foreign_key: true
      t.references :ssd, null: false, foreign_key: true

      t.timestamps
    end
  end
end
