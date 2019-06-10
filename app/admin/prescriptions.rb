ActiveAdmin.register Prescription do

 permit_params :client_id, :medication_id, :pet_id, :quantity, :package_size, :dosage, :dosage_time_units, :refills, :request_date, :veterinarian_id, :user_id, :approved, :denial_code_id
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
