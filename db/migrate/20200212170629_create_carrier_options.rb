class CreateCarrierOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :carrier_options do |t|
      t.integer :min_vol
      t.integer :max_vol
      t.float :price_kg
      t.references :carrier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
