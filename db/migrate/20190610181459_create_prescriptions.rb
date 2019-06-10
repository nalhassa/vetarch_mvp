class CreatePrescriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :prescriptions do |t|
      t.integer :client_id
      t.integer :medication_id
      t.integer :pet_id
      t.integer :quantity
      t.integer :package_size
      t.float :dosage
      t.string :dosage_time_units
      t.integer :refills
      t.datetime :request_date
      t.integer :veterinarian_id
      t.integer :user_id
      t.boolean :approved
      t.integer :denial_code_id

      t.timestamps
    end
  end
end
