class PetsController < ApplicationController
  def index
    @pets = Pet.all

    render("pet_templates/index.html.erb")
  end

  def show
    @pet = Pet.find(params.fetch("id_to_display"))

    render("pet_templates/show.html.erb")
  end

  def new_form
    @pet = Pet.new

    render("pet_templates/new_form.html.erb")
  end

  def create_row
    @pet = Pet.new

    @pet.name = params.fetch("name")
    @pet.dob = params.fetch("dob")
    @pet.weight = params.fetch("weight")
    @pet.client_id = params.fetch("client_id")
    @pet.species = params.fetch("species")

    if @pet.valid?
      @pet.save

      redirect_back(:fallback_location => "/pets", :notice => "Pet created successfully.")
    else
      render("pet_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @pet = Pet.find(params.fetch("prefill_with_id"))

    render("pet_templates/edit_form.html.erb")
  end

  def update_row
    @pet = Pet.find(params.fetch("id_to_modify"))

    @pet.name = params.fetch("name")
    @pet.dob = params.fetch("dob")
    @pet.weight = params.fetch("weight")
    @pet.client_id = params.fetch("client_id")
    @pet.species = params.fetch("species")

    if @pet.valid?
      @pet.save

      redirect_to("/pets/#{@pet.id}", :notice => "Pet updated successfully.")
    else
      render("pet_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_client
    @pet = Pet.find(params.fetch("id_to_remove"))

    @pet.destroy

    redirect_to("/clients/#{@pet.client_id}", notice: "Pet deleted successfully.")
  end

  def destroy_row
    @pet = Pet.find(params.fetch("id_to_remove"))

    @pet.destroy

    redirect_to("/pets", :notice => "Pet deleted successfully.")
  end
end
