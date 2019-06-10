Rails.application.routes.draw do
  # Routes for the Medication resource:

  # CREATE
  get("/medications/new", { :controller => "medications", :action => "new_form" })
  post("/create_medication", { :controller => "medications", :action => "create_row" })

  # READ
  get("/medications", { :controller => "medications", :action => "index" })
  get("/medications/:id_to_display", { :controller => "medications", :action => "show" })

  # UPDATE
  get("/medications/:prefill_with_id/edit", { :controller => "medications", :action => "edit_form" })
  post("/update_medication/:id_to_modify", { :controller => "medications", :action => "update_row" })

  # DELETE
  get("/delete_medication/:id_to_remove", { :controller => "medications", :action => "destroy_row" })

  #------------------------------

  # Routes for the Pet resource:

  # CREATE
  get("/pets/new", { :controller => "pets", :action => "new_form" })
  post("/create_pet", { :controller => "pets", :action => "create_row" })

  # READ
  get("/pets", { :controller => "pets", :action => "index" })
  get("/pets/:id_to_display", { :controller => "pets", :action => "show" })

  # UPDATE
  get("/pets/:prefill_with_id/edit", { :controller => "pets", :action => "edit_form" })
  post("/update_pet/:id_to_modify", { :controller => "pets", :action => "update_row" })

  # DELETE
  get("/delete_pet/:id_to_remove", { :controller => "pets", :action => "destroy_row" })

  #------------------------------

  # Routes for the Prescription resource:

  # CREATE
  get("/prescriptions/new", { :controller => "prescriptions", :action => "new_form" })
  post("/create_prescription", { :controller => "prescriptions", :action => "create_row" })

  # READ
  get("/prescriptions", { :controller => "prescriptions", :action => "index" })
  get("/prescriptions/:id_to_display", { :controller => "prescriptions", :action => "show" })

  # UPDATE
  get("/prescriptions/:prefill_with_id/edit", { :controller => "prescriptions", :action => "edit_form" })
  post("/update_prescription/:id_to_modify", { :controller => "prescriptions", :action => "update_row" })

  # DELETE
  get("/delete_prescription/:id_to_remove", { :controller => "prescriptions", :action => "destroy_row" })

  #------------------------------

  # Routes for the Client resource:

  # CREATE
  get("/clients/new", { :controller => "clients", :action => "new_form" })
  post("/create_client", { :controller => "clients", :action => "create_row" })

  # READ
  get("/clients", { :controller => "clients", :action => "index" })
  get("/clients/:id_to_display", { :controller => "clients", :action => "show" })

  # UPDATE
  get("/clients/:prefill_with_id/edit", { :controller => "clients", :action => "edit_form" })
  post("/update_client/:id_to_modify", { :controller => "clients", :action => "update_row" })

  # DELETE
  get("/delete_client/:id_to_remove", { :controller => "clients", :action => "destroy_row" })

  #------------------------------

  # Routes for the Veterinarian resource:

  # CREATE
  get("/veterinarians/new", { :controller => "veterinarians", :action => "new_form" })
  post("/create_veterinarian", { :controller => "veterinarians", :action => "create_row" })

  # READ
  get("/veterinarians", { :controller => "veterinarians", :action => "index" })
  get("/veterinarians/:id_to_display", { :controller => "veterinarians", :action => "show" })

  # UPDATE
  get("/veterinarians/:prefill_with_id/edit", { :controller => "veterinarians", :action => "edit_form" })
  post("/update_veterinarian/:id_to_modify", { :controller => "veterinarians", :action => "update_row" })

  # DELETE
  get("/delete_veterinarian/:id_to_remove", { :controller => "veterinarians", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
