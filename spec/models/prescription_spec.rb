require 'rails_helper'

RSpec.describe Prescription, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:denial_code) }

    it { should belong_to(:medication) }

    it { should belong_to(:pet) }

    it { should belong_to(:client) }

    it { should belong_to(:veterinarian) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
