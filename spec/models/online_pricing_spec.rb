require 'rails_helper'

RSpec.describe OnlinePricing, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:medication) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
