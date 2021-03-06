class MedicationsController < ApplicationController
  def index
    @q = Medication.ransack(params[:q])
    @medications = @q.result(:distinct => true).includes(:prescriptions, :pricings, :internal_pricing).page(params[:page]).per(10)

    render("medication_templates/index.html.erb")
  end

  def show
    @online_pricing = OnlinePricing.new
    @prescription = Prescription.new
    @medication = Medication.find(params.fetch("id_to_display"))

    render("medication_templates/show.html.erb")
  end

  def new_form
    @medication = Medication.new

    render("medication_templates/new_form.html.erb")
  end

  def create_row
    @medication = Medication.new

    @medication.name = params.fetch("name")
    @medication.category = params.fetch("category")
    @medication.amount_mg = params.fetch("amount_mg")

    if @medication.valid?
      @medication.save

      redirect_back(:fallback_location => "/medications", :notice => "Medication created successfully.")
    else
      render("medication_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @medication = Medication.find(params.fetch("prefill_with_id"))

    render("medication_templates/edit_form.html.erb")
  end

  def update_row
    @medication = Medication.find(params.fetch("id_to_modify"))

    @medication.name = params.fetch("name")
    @medication.category = params.fetch("category")
    @medication.amount_mg = params.fetch("amount_mg")

    if @medication.valid?
      @medication.save

      redirect_to("/medications/#{@medication.id}", :notice => "Medication updated successfully.")
    else
      render("medication_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @medication = Medication.find(params.fetch("id_to_remove"))

    @medication.destroy

    redirect_to("/medications", :notice => "Medication deleted successfully.")
  end
end
