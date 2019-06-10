class InternalPricingsController < ApplicationController
  def index
    @internal_pricings = InternalPricing.page(params[:page]).per(10)

    render("internal_pricing_templates/index.html.erb")
  end

  def show
    @internal_pricing = InternalPricing.find(params.fetch("id_to_display"))

    render("internal_pricing_templates/show.html.erb")
  end

  def new_form
    @internal_pricing = InternalPricing.new

    render("internal_pricing_templates/new_form.html.erb")
  end

  def create_row
    @internal_pricing = InternalPricing.new

    @internal_pricing.cet = params.fetch("cet")
    @internal_pricing.price = params.fetch("price")
    @internal_pricing.cogs = params.fetch("cogs")
    @internal_pricing.medication_id = params.fetch("medication_id")

    if @internal_pricing.valid?
      @internal_pricing.save

      redirect_back(:fallback_location => "/internal_pricings", :notice => "Internal pricing created successfully.")
    else
      render("internal_pricing_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @internal_pricing = InternalPricing.find(params.fetch("prefill_with_id"))

    render("internal_pricing_templates/edit_form.html.erb")
  end

  def update_row
    @internal_pricing = InternalPricing.find(params.fetch("id_to_modify"))

    @internal_pricing.cet = params.fetch("cet")
    @internal_pricing.price = params.fetch("price")
    @internal_pricing.cogs = params.fetch("cogs")
    @internal_pricing.medication_id = params.fetch("medication_id")

    if @internal_pricing.valid?
      @internal_pricing.save

      redirect_to("/internal_pricings/#{@internal_pricing.id}", :notice => "Internal pricing updated successfully.")
    else
      render("internal_pricing_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @internal_pricing = InternalPricing.find(params.fetch("id_to_remove"))

    @internal_pricing.destroy

    redirect_to("/internal_pricings", :notice => "Internal pricing deleted successfully.")
  end
end
