class CreateInternalPricings < ActiveRecord::Migration[5.1]
  def change
    create_table :internal_pricings do |t|
      t.string :cet
      t.float :price
      t.string :cogs
      t.integer :medication_id

      t.timestamps
    end
  end
end
