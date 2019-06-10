class DenialCodesController < ApplicationController
  def index
    @q = DenialCode.ransack(params[:q])
    @denial_codes = @q.result(:distinct => true).includes(:prescriptions).page(params[:page]).per(10)

    render("denial_code_templates/index.html.erb")
  end

  def show
    @prescription = Prescription.new
    @denial_code = DenialCode.find(params.fetch("id_to_display"))

    render("denial_code_templates/show.html.erb")
  end

  def new_form
    @denial_code = DenialCode.new

    render("denial_code_templates/new_form.html.erb")
  end

  def create_row
    @denial_code = DenialCode.new

    @denial_code.code = params.fetch("code")

    if @denial_code.valid?
      @denial_code.save

      redirect_back(:fallback_location => "/denial_codes", :notice => "Denial code created successfully.")
    else
      render("denial_code_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @denial_code = DenialCode.find(params.fetch("prefill_with_id"))

    render("denial_code_templates/edit_form.html.erb")
  end

  def update_row
    @denial_code = DenialCode.find(params.fetch("id_to_modify"))

    @denial_code.code = params.fetch("code")

    if @denial_code.valid?
      @denial_code.save

      redirect_to("/denial_codes/#{@denial_code.id}", :notice => "Denial code updated successfully.")
    else
      render("denial_code_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @denial_code = DenialCode.find(params.fetch("id_to_remove"))

    @denial_code.destroy

    redirect_to("/denial_codes", :notice => "Denial code deleted successfully.")
  end
end
