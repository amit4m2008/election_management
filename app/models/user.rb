class User < ApplicationRecord
  ## Associations
  has_many :votes
  has_and_belongs_to_many :groups

  ## Validations
  validates_presence_of :name, :email
end
