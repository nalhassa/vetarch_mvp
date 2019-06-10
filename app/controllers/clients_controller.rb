class ClientsController < ApplicationController
  def index
    @clients = Client.all

    render("client_templates/index.html.erb")
  end

  def show
    @pet = Pet.new
    @prescription = Prescription.new
    @client = Client.find(params.fetch("id_to_display"))

    render("client_templates/show.html.erb")
  end

  def new_form
    @client = Client.new

    render("client_templates/new_form.html.erb")
  end

  def create_row
    @client = Client.new

    @client.first_name = params.fetch("first_name")
    @client.last_name = params.fetch("last_name")
    @client.street_address = params.fetch("street_address")
    @client.zip_code = params.fetch("zip_code")
    @client.apartment_number = params.fetch("apartment_number")

    if @client.valid?
      @client.save

      redirect_back(:fallback_location => "/clients", :notice => "Client created successfully.")
    else
      render("client_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @client = Client.find(params.fetch("prefill_with_id"))

    render("client_templates/edit_form.html.erb")
  end

  def update_row
    @client = Client.find(params.fetch("id_to_modify"))

    @client.first_name = params.fetch("first_name")
    @client.last_name = params.fetch("last_name")
    @client.street_address = params.fetch("street_address")
    @client.zip_code = params.fetch("zip_code")
    @client.apartment_number = params.fetch("apartment_number")

    if @client.valid?
      @client.save

      redirect_to("/clients/#{@client.id}", :notice => "Client updated successfully.")
    else
      render("client_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @client = Client.find(params.fetch("id_to_remove"))

    @client.destroy

    redirect_to("/clients", :notice => "Client deleted successfully.")
  end
end
