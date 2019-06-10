require 'rails_helper'

RSpec.describe Pet, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:client) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
