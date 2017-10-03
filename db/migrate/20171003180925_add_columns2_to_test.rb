class AddColumns2ToTest < ActiveRecord::Migration[5.0]
  def change
    add_column :tests, :total_monitor_period_min, :integer
    add_column :tests, :period_seg, :integer
    add_column :tests, :length_array_prices, :integer
  end
end
