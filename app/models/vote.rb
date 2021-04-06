class Vote < ApplicationRecord
  ## Associations
  belongs_to :user
  belongs_to :election

  ## Validations
  validates_presence_of :user_id, :election_id
  validates_uniqueness_of :user_id, scope: :election_id, message: "You have already casted your vote."
end
