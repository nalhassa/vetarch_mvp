class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.datetime :dob
      t.integer :weight
      t.integer :client_id
      t.string :species

      t.timestamps
    end
  end
end
