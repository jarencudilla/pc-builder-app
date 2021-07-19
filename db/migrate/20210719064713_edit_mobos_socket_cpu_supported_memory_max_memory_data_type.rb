class EditMobosSocketCpuSupportedMemoryMaxMemoryDataType < ActiveRecord::Migration[6.0]
  def change
    change_column :mobos, :socket_cpu, :string
    change_column :mobos, :supported_memory, "varchar[] USING (string_to_array(supported_memory, ','))"
    change_column :mobos, :max_memory, :string
  end
end
