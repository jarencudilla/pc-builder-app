class CreateBuildSsds < ActiveRecord::Migration[6.0]
  def change
    create_table :build_ssds do |t|

      t.timestamps
    end
  end
end
