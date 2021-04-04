class Group < ApplicationRecord
  ## Associations
  has_many :elections
  has_and_belongs_to_many :users

  ## Validations
  validates :name, presence: true
end
