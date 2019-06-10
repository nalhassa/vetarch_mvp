class CreateDenialCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :denial_codes do |t|
      t.string :code

      t.timestamps
    end
  end
end
