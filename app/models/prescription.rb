class Prescription < ApplicationRecord
  # Direct associations

  belongs_to :denial_code,
             :required => false

  belongs_to :medication

  belongs_to :pet

  belongs_to :client,
             :counter_cache => true

  belongs_to :veterinarian,
             :required => false

  belongs_to :user

  # Indirect associations

  # Validations

end
