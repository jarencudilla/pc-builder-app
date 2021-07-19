class ChangePsusModularEfficiencyRatingWattageDataTypes < ActiveRecord::Migration[6.0]
  def change
    change_column :psus, :modular, :string
    change_column :psus, :efficiency_rating, :string
    change_column :psus, :wattage, :string
  end
end
