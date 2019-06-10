class AddPrescriptionCountToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :prescriptions_count, :integer
  end
end
