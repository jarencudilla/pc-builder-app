class CreateSsds < ActiveRecord::Migration[6.0]
  def change
    create_table :ssds do |t|
      t.string :name
      t.string :image
      t.string :capacity
      t.string :type
      t.string :form_factor
      t.string :nand_flash
      t.string :interface
      t.string :rating
      t.float :price
  
      t.timestamps
    end
  end
end
