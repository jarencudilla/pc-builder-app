class AddRamsMemorySizeColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :rams, :memory_size, :string
  end
end
