class Prescription < ApplicationRecord
  # Direct associations

  belongs_to :veterinarian,
             :required => false

  belongs_to :user

  # Indirect associations

  # Validations

end
