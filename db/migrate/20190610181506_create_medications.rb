class CreateMedications < ActiveRecord::Migration[5.1]
  def change
    create_table :medications do |t|
      t.string :name
      t.string :category
      t.integer :amount_mg

      t.timestamps
    end
  end
end
