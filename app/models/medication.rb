class Medication < ApplicationRecord
  # Direct associations

  has_one    :internal_pricing

  has_many   :pricings,
             :class_name => "OnlinePricing"

  has_many   :prescriptions

  # Indirect associations

  # Validations

end
