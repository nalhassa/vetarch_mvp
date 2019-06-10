class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :street_address
      t.string :zip_code
      t.string :apartment_number

      t.timestamps
    end
  end
end
