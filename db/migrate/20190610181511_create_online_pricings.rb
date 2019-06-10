class CreateOnlinePricings < ActiveRecord::Migration[5.1]
  def change
    create_table :online_pricings do |t|
      t.string :provider
      t.float :price
      t.boolean :ppd
      t.string :hyperlink
      t.integer :medication_id

      t.timestamps
    end
  end
end
