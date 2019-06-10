class OnlinePricingsController < ApplicationController
  def index
    @online_pricings = OnlinePricing.all

    render("online_pricing_templates/index.html.erb")
  end

  def show
    @online_pricing = OnlinePricing.find(params.fetch("id_to_display"))

    render("online_pricing_templates/show.html.erb")
  end

  def new_form
    @online_pricing = OnlinePricing.new

    render("online_pricing_templates/new_form.html.erb")
  end

  def create_row
    @online_pricing = OnlinePricing.new

    @online_pricing.provider = params.fetch("provider")
    @online_pricing.price = params.fetch("price")
    @online_pricing.ppd = params.fetch("ppd")
    @online_pricing.hyperlink = params.fetch("hyperlink")
    @online_pricing.medication_id = params.fetch("medication_id")

    if @online_pricing.valid?
      @online_pricing.save

      redirect_back(:fallback_location => "/online_pricings", :notice => "Online pricing created successfully.")
    else
      render("online_pricing_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_medication
    @online_pricing = OnlinePricing.new

    @online_pricing.provider = params.fetch("provider")
    @online_pricing.price = params.fetch("price")
    @online_pricing.ppd = params.fetch("ppd")
    @online_pricing.hyperlink = params.fetch("hyperlink")
    @online_pricing.medication_id = params.fetch("medication_id")

    if @online_pricing.valid?
      @online_pricing.save

      redirect_to("/medications/#{@online_pricing.medication_id}", notice: "OnlinePricing created successfully.")
    else
      render("online_pricing_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @online_pricing = OnlinePricing.find(params.fetch("prefill_with_id"))

    render("online_pricing_templates/edit_form.html.erb")
  end

  def update_row
    @online_pricing = OnlinePricing.find(params.fetch("id_to_modify"))

    @online_pricing.provider = params.fetch("provider")
    @online_pricing.price = params.fetch("price")
    @online_pricing.ppd = params.fetch("ppd")
    @online_pricing.hyperlink = params.fetch("hyperlink")
    @online_pricing.medication_id = params.fetch("medication_id")

    if @online_pricing.valid?
      @online_pricing.save

      redirect_to("/online_pricings/#{@online_pricing.id}", :notice => "Online pricing updated successfully.")
    else
      render("online_pricing_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_medication
    @online_pricing = OnlinePricing.find(params.fetch("id_to_remove"))

    @online_pricing.destroy

    redirect_to("/medications/#{@online_pricing.medication_id}", notice: "OnlinePricing deleted successfully.")
  end

  def destroy_row
    @online_pricing = OnlinePricing.find(params.fetch("id_to_remove"))

    @online_pricing.destroy

    redirect_to("/online_pricings", :notice => "Online pricing deleted successfully.")
  end
end
