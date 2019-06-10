class Pet < ApplicationRecord
  # Direct associations

  belongs_to :client,
             :counter_cache => true

  # Indirect associations

  # Validations

end
