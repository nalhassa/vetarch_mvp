class Pet < ApplicationRecord
  # Direct associations

  has_many   :prescriptions

  belongs_to :client,
             :counter_cache => true

  # Indirect associations

  # Validations

end
