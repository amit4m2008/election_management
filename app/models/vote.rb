class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :election

  #Validations
  validates_presence_of :user_id, :election_id

end
