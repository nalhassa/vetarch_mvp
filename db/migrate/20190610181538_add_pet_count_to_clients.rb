class AddPetCountToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :pets_count, :integer
  end
end
