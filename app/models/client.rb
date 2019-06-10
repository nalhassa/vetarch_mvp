class Client < ApplicationRecord
  # Direct associations

  has_many   :pets

  has_many   :prescriptions

  # Indirect associations

  # Validations

end
