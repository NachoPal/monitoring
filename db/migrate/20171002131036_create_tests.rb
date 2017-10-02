class CreateTests < ActiveRecord::Migration[5.0]
  def change
    create_table :tests do |t|
      t.belongs_to :account, index: true
      t.decimal :threshold_of_gain
      t.decimal :threshold_of_lost
      t.decimal :sky_rocket_gain
      t.decimal :sky_rocket_period_seg
      t.decimal :trend_threshold
      t.integer :percentile_volume
      t.integer :get_rid_off_after_min
      t.integer :quarantine_to_buy_min

      t.timestamps
    end
  end
end