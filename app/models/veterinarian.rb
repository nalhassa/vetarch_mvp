class Veterinarian < ApplicationRecord
  # Direct associations

  has_many   :prescriptions

  # Indirect associations

  # Validations

end
