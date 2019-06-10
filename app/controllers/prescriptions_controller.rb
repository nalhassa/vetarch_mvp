class PrescriptionsController < ApplicationController
  before_action :current_user_must_be_prescription_user, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_prescription_user
    prescription = Prescription.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == prescription.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Prescription.ransack(params[:q])
    @prescriptions = @q.result(:distinct => true).includes(:user, :veterinarian, :client, :pet, :medication, :denial_code).page(params[:page]).per(10)

    render("prescription_templates/index.html.erb")
  end

  def show
    @prescription = Prescription.find(params.fetch("id_to_display"))

    render("prescription_templates/show.html.erb")
  end

  def new_form
    @prescription = Prescription.new

    render("prescription_templates/new_form.html.erb")
  end

  def create_row
    @prescription = Prescription.new

    @prescription.client_id = params.fetch("client_id")
    @prescription.medication_id = params.fetch("medication_id")
    @prescription.pet_id = params.fetch("pet_id")
    @prescription.quantity = params.fetch("quantity")
    @prescription.package_size = params.fetch("package_size")
    @prescription.dosage = params.fetch("dosage")
    @prescription.dosage_time_units = params.fetch("dosage_time_units")
    @prescription.refills = params.fetch("refills")
    @prescription.request_date = params.fetch("request_date")
    @prescription.veterinarian_id = params.fetch("veterinarian_id")
    @prescription.user_id = params.fetch("user_id")
    @prescription.approved = params.fetch("approved")
    @prescription.denial_code_id = params.fetch("denial_code_id")

    if @prescription.valid?
      @prescription.save

      redirect_back(:fallback_location => "/prescriptions", :notice => "Prescription created successfully.")
    else
      render("prescription_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_veterinarian
    @prescription = Prescription.new

    @prescription.client_id = params.fetch("client_id")
    @prescription.medication_id = params.fetch("medication_id")
    @prescription.pet_id = params.fetch("pet_id")
    @prescription.quantity = params.fetch("quantity")
    @prescription.package_size = params.fetch("package_size")
    @prescription.dosage = params.fetch("dosage")
    @prescription.dosage_time_units = params.fetch("dosage_time_units")
    @prescription.refills = params.fetch("refills")
    @prescription.request_date = params.fetch("request_date")
    @prescription.veterinarian_id = params.fetch("veterinarian_id")
    @prescription.user_id = params.fetch("user_id")
    @prescription.approved = params.fetch("approved")
    @prescription.denial_code_id = params.fetch("denial_code_id")

    if @prescription.valid?
      @prescription.save

      redirect_to("/veterinarians/#{@prescription.veterinarian_id}", notice: "Prescription created successfully.")
    else
      render("prescription_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_client
    @prescription = Prescription.new

    @prescription.client_id = params.fetch("client_id")
    @prescription.medication_id = params.fetch("medication_id")
    @prescription.pet_id = params.fetch("pet_id")
    @prescription.quantity = params.fetch("quantity")
    @prescription.package_size = params.fetch("package_size")
    @prescription.dosage = params.fetch("dosage")
    @prescription.dosage_time_units = params.fetch("dosage_time_units")
    @prescription.refills = params.fetch("refills")
    @prescription.request_date = params.fetch("request_date")
    @prescription.veterinarian_id = params.fetch("veterinarian_id")
    @prescription.user_id = params.fetch("user_id")
    @prescription.approved = params.fetch("approved")
    @prescription.denial_code_id = params.fetch("denial_code_id")

    if @prescription.valid?
      @prescription.save

      redirect_to("/clients/#{@prescription.client_id}", notice: "Prescription created successfully.")
    else
      render("prescription_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_pet
    @prescription = Prescription.new

    @prescription.client_id = params.fetch("client_id")
    @prescription.medication_id = params.fetch("medication_id")
    @prescription.pet_id = params.fetch("pet_id")
    @prescription.quantity = params.fetch("quantity")
    @prescription.package_size = params.fetch("package_size")
    @prescription.dosage = params.fetch("dosage")
    @prescription.dosage_time_units = params.fetch("dosage_time_units")
    @prescription.refills = params.fetch("refills")
    @prescription.request_date = params.fetch("request_date")
    @prescription.veterinarian_id = params.fetch("veterinarian_id")
    @prescription.user_id = params.fetch("user_id")
    @prescription.approved = params.fetch("approved")
    @prescription.denial_code_id = params.fetch("denial_code_id")

    if @prescription.valid?
      @prescription.save

      redirect_to("/pets/#{@prescription.pet_id}", notice: "Prescription created successfully.")
    else
      render("prescription_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_medication
    @prescription = Prescription.new

    @prescription.client_id = params.fetch("client_id")
    @prescription.medication_id = params.fetch("medication_id")
    @prescription.pet_id = params.fetch("pet_id")
    @prescription.quantity = params.fetch("quantity")
    @prescription.package_size = params.fetch("package_size")
    @prescription.dosage = params.fetch("dosage")
    @prescription.dosage_time_units = params.fetch("dosage_time_units")
    @prescription.refills = params.fetch("refills")
    @prescription.request_date = params.fetch("request_date")
    @prescription.veterinarian_id = params.fetch("veterinarian_id")
    @prescription.user_id = params.fetch("user_id")
    @prescription.approved = params.fetch("approved")
    @prescription.denial_code_id = params.fetch("denial_code_id")

    if @prescription.valid?
      @prescription.save

      redirect_to("/medications/#{@prescription.medication_id}", notice: "Prescription created successfully.")
    else
      render("prescription_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_denial_code
    @prescription = Prescription.new

    @prescription.client_id = params.fetch("client_id")
    @prescription.medication_id = params.fetch("medication_id")
    @prescription.pet_id = params.fetch("pet_id")
    @prescription.quantity = params.fetch("quantity")
    @prescription.package_size = params.fetch("package_size")
    @prescription.dosage = params.fetch("dosage")
    @prescription.dosage_time_units = params.fetch("dosage_time_units")
    @prescription.refills = params.fetch("refills")
    @prescription.request_date = params.fetch("request_date")
    @prescription.veterinarian_id = params.fetch("veterinarian_id")
    @prescription.user_id = params.fetch("user_id")
    @prescription.approved = params.fetch("approved")
    @prescription.denial_code_id = params.fetch("denial_code_id")

    if @prescription.valid?
      @prescription.save

      redirect_to("/denial_codes/#{@prescription.denial_code_id}", notice: "Prescription created successfully.")
    else
      render("prescription_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @prescription = Prescription.find(params.fetch("prefill_with_id"))

    render("prescription_templates/edit_form.html.erb")
  end

  def update_row
    @prescription = Prescription.find(params.fetch("id_to_modify"))

    @prescription.client_id = params.fetch("client_id")
    @prescription.medication_id = params.fetch("medication_id")
    @prescription.pet_id = params.fetch("pet_id")
    @prescription.quantity = params.fetch("quantity")
    @prescription.package_size = params.fetch("package_size")
    @prescription.dosage = params.fetch("dosage")
    @prescription.dosage_time_units = params.fetch("dosage_time_units")
    @prescription.refills = params.fetch("refills")
    @prescription.request_date = params.fetch("request_date")
    @prescription.veterinarian_id = params.fetch("veterinarian_id")
    
    @prescription.approved = params.fetch("approved")
    @prescription.denial_code_id = params.fetch("denial_code_id")

    if @prescription.valid?
      @prescription.save

      redirect_to("/prescriptions/#{@prescription.id}", :notice => "Prescription updated successfully.")
    else
      render("prescription_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @prescription = Prescription.find(params.fetch("id_to_remove"))

    @prescription.destroy

    redirect_to("/users/#{@prescription.user_id}", notice: "Prescription deleted successfully.")
  end

  def destroy_row_from_veterinarian
    @prescription = Prescription.find(params.fetch("id_to_remove"))

    @prescription.destroy

    redirect_to("/veterinarians/#{@prescription.veterinarian_id}", notice: "Prescription deleted successfully.")
  end

  def destroy_row_from_client
    @prescription = Prescription.find(params.fetch("id_to_remove"))

    @prescription.destroy

    redirect_to("/clients/#{@prescription.client_id}", notice: "Prescription deleted successfully.")
  end

  def destroy_row_from_pet
    @prescription = Prescription.find(params.fetch("id_to_remove"))

    @prescription.destroy

    redirect_to("/pets/#{@prescription.pet_id}", notice: "Prescription deleted successfully.")
  end

  def destroy_row_from_medication
    @prescription = Prescription.find(params.fetch("id_to_remove"))

    @prescription.destroy

    redirect_to("/medications/#{@prescription.medication_id}", notice: "Prescription deleted successfully.")
  end

  def destroy_row_from_denial_code
    @prescription = Prescription.find(params.fetch("id_to_remove"))

    @prescription.destroy

    redirect_to("/denial_codes/#{@prescription.denial_code_id}", notice: "Prescription deleted successfully.")
  end

  def destroy_row
    @prescription = Prescription.find(params.fetch("id_to_remove"))

    @prescription.destroy

    redirect_to("/prescriptions", :notice => "Prescription deleted successfully.")
  end
end
