class VeterinariansController < ApplicationController
  def index
    @veterinarians = Veterinarian.all

    render("veterinarian_templates/index.html.erb")
  end

  def show
    @prescription = Prescription.new
    @veterinarian = Veterinarian.find(params.fetch("id_to_display"))

    render("veterinarian_templates/show.html.erb")
  end

  def new_form
    @veterinarian = Veterinarian.new

    render("veterinarian_templates/new_form.html.erb")
  end

  def create_row
    @veterinarian = Veterinarian.new

    @veterinarian.first_name = params.fetch("first_name")
    @veterinarian.last_name = params.fetch("last_name")

    if @veterinarian.valid?
      @veterinarian.save

      redirect_back(:fallback_location => "/veterinarians", :notice => "Veterinarian created successfully.")
    else
      render("veterinarian_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @veterinarian = Veterinarian.find(params.fetch("prefill_with_id"))

    render("veterinarian_templates/edit_form.html.erb")
  end

  def update_row
    @veterinarian = Veterinarian.find(params.fetch("id_to_modify"))

    @veterinarian.first_name = params.fetch("first_name")
    @veterinarian.last_name = params.fetch("last_name")

    if @veterinarian.valid?
      @veterinarian.save

      redirect_to("/veterinarians/#{@veterinarian.id}", :notice => "Veterinarian updated successfully.")
    else
      render("veterinarian_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @veterinarian = Veterinarian.find(params.fetch("id_to_remove"))

    @veterinarian.destroy

    redirect_to("/veterinarians", :notice => "Veterinarian deleted successfully.")
  end
end
