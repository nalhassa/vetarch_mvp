require 'rails_helper'

RSpec.describe Medication, type: :model do
  
    describe "Direct Associations" do

    it { should have_one(:internal_pricing) }

    it { should have_many(:pricings) }

    it { should have_many(:prescriptions) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
