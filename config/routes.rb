Rails.application.routes.draw do
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
