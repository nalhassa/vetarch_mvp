class Prescription < ApplicationRecord
  # Direct associations

  belongs_to :pet

  belongs_to :client,
             :counter_cache => true

  belongs_to :veterinarian,
             :required => false

  belongs_to :user

  # Indirect associations

  # Validations

end
